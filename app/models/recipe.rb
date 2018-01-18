class Recipe < ApplicationRecord
  attribute    :vegetarian, :boolean
    attribute  :vegan, :boolean
  attribute    :glutenFree, :boolean
  attribute    :dairyFree, :boolean
attribute      :veryHealthy, :boolean
  attribute    :cheap, :boolean
    attribute  :veryPopular, :boolean
    attribute  :sustainable, :boolean
    attribute  :weightWatcherSmartPoints, :integer
    attribute  :gaps, :string
    attribute  :lowFodmap, :boolean
    attribute  :ketogenic, :boolean
    attribute  :whole30, :boolean
    attribute  :servings, :integer
    attribute  :preparationMinutes, :integer
    attribute  :cookingMinutes, :integer
    attribute  :sourceUrl, :string
    attribute  :spoonacularSourceUrl, :string
    attribute  :aggregateLikes, :integer
    attribute  :creditText, :string
    attribute  :sourceName, :string
    attribute  :extendedIngredients, :string
    attribute :spoonacularScore, :integer
    attribute :healthScore, :integer
    attribute :pricePerServing, :float
    attribute :title, :string
    attribute :readyInMinutes, :integer
    attribute :image, :string
    attribute :imageType, :string
    attribute :instructions, :text
    attribute :cuisines, :string
    attribute :dishTypes, :string
    attribute :diets, :string
    attribute :occasions, :string
    attribute :analyzedInstructions, :text
    attribute :winePairing, :string
    

end
