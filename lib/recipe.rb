class Recipe
  # expecting recipe.name to return the name
  # expecting recipe.description to return the name
  # Instead of making dedicated methods
  # We can achieve this by using attribute reader
  attr_reader :name, :description

  # expecting initialize method
  # expecting name
  # expecting description
  # As name and description must be added by user
  # We pass them in as arguments when a user calls Recipe.new(name, description)
  def initialize(name, description)
    @name = name
    @description = description
  end
end
