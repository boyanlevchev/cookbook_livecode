require 'csv'

class Cookbook
  # expecting initialize method
  def initialize(file_path)
    # We want to access file path in load and save CSV
    # So we make it accessible throughout our Class
    @file_path = file_path
    # should create an array `@recipes`
    @recipes = []
    # When we first boot up our application, we want all recipes to load in from long-term memory
    # So we call load-csv method to add them to our recipes array above
    load_csv
  end

  # expecting all method
  def all
    # should give access to all recipes
    return @recipes
  end

  # expecting add_recipe method
  def add_recipe(new_recipe)
    # should add a recipe to the cookbook
    @recipes << new_recipe
    # should store the new recipe in CSV
    save_to_csv
  end
 # expecting remove_recipe method
  def remove_recipe(index)
    # should remove a recipe from the cookbook
    @recipes.delete_at(index)
    # should remove the recipe from the CSV
    save_to_csv
  end

  # We create a load_csv method, and run it when we initialize our cookbook
  # So that at the start of our program, all recipes are loaded into RAM from the CSV
  # And our application can then do what it wants with them
  def load_csv
    CSV.foreach(@file_path) do |row|
      # Our CSV stores strings only - so we must initialize all our recipes
      recipe = Recipe.new(row[0],row[1])
      # We push them into the cookbook recipes array
      @recipes << recipe
    end
  end

  # We create a method that will run everytime we create a new recipe
  # This way, every new recipe will also generate a new row in CSV
  # And if our application crashes, or we quit
  # The recipes will be persisted in long-term memory
  def save_to_csv
    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.open(@file_path, 'wb', csv_options) do |csv_row|
      # To store recipes, we loop over cookbook recipes array (see initializer)
      @recipes.each do |recipe|
        # CSV SHOULD NOT TAKE INSTANCES
        # We must individually separate the name and description from the instances
        # To then store them in array format into each row of the CSV
        # One row per recipe
        csv_row << [recipe.name, recipe.description]
      end
    end
  end
end
