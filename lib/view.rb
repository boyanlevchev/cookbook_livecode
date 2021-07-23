class View
  # expecting display method
  def display(recipes)
    # should implement a method to display recipes
    recipes.each_with_index do |recipe, index|
      # For better user experience, we display recipes with an index number
      # It's name, and it's description
      # Rather than just dsiplaying the recipe instances
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  # To create a recipe, our controller tells the view that
  # it must ask the user for a recipe
  def ask_for_recipe
    # We ask the user for the name of the recipe
    puts "What is the name of your recipe?"
    name = gets.chomp
    # We ask the user for the description
    puts "What is the description?"
    description = gets.chomp

    # we return an array of the name and description
    # Returned as array, so that we can return 2 things at the same time!
    return [name, description]

    # Alternatively, you could approach the above,
    # by creating a separating view method asking for name
    # and a separate method asking for description
  end

  # To destroy a recipe, our controller tells the view that
  # it must ask the user for an index to destroy
  def what_do_you_want_to_destroy
    # As indexes have been displayed with + 1 for user experience sake (see display method above)
    # We want to make sure that we then do - 1
    # So that it corresponds to the actual array index
    puts "What number do you want to destroy?"
    gets.chomp.to_i - 1
  end
end
