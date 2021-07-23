require_relative 'view'
require_relative 'recipe'

class Controller
  # expecting initialize method
  def initialize(cookbook)
    # Should store the Cookbook in an instance variable
    @cookbook = cookbook
    # We need a view instance, so that we can call view methods
    # That will query the user for new recipes, and which recipes to delete
    @view = View.new
  end

  # expecting list method
  def list
    # retrieve all recipes from cookbook
    recipes = @cookbook.all
    # Send recipes to the view to be displayed to user
    @view.display(recipes)
  end

  # expecting create method
  def create
    # Tell view to ask user for recipe name and description
    # Store user response in recipe_data
    # (they are returned as array by ask_for_recipe method in view)
    recipe_data = @view.ask_for_recipe
    # we create a new Recipe instance, using name and description
    # 0 index corresponds to name
    # 1 index corresponds to description
    recipe = Recipe.new(recipe_data[0], recipe_data[1])
    # We add recipe instance to cookbook array (@recipes in cookbook intializer)
    @cookbook.add_recipe(recipe)
  end

  # expecting destroy method
  def destroy
    # we call list method from above, for better user experience
    list
    # We tell view to ask user for recipe index to destroy
    # and asign it to index
    index = @view.what_do_you_want_to_destroy
    # We tell cookbook to destroy the recipe
    # By giving it the index at which to remove recipe from array
    @cookbook.remove_recipe(index)
  end
end
