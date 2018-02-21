class RecipesController < ApplicationController

  def index
    @response = HTTParty.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random?limitLicense=false&number=10", headers:{"X-Mashape-Key" => "lIOsRhZMTKmshyZ09B79rcDrwYNJp1gIzZmjsnPFBdpnDRnySc","Accept" => "application/json"})
    @recipes =@response["recipes"].map do |recipe|
      recipe_attrs = recipe.keep_if {|k, v| Recipe.column_names.include? k}
      Recipe.find_or_create_by(recipe_attrs)
    end
    #@recipes = @response["recipes"]
  end

  def find(id)
      response = HTTPary.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id}/information?includeNutrition=false",
  headers:{
    "X-Mashape-Key" => "OOLh4hg0Jkmsh9pPfNOOIYnCTqmGp15RBhSjsn9qaLqenGvhyS",
    "Accept" => "application/json"
  })
      Recipe.new(response)
    end

  def show
    @recipe = Recipe.find(params[:id])
  end



 def all
    if params[:search]
    @search_result = HTTParty.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?instructionsRequired=false&limitLicense=false&number=10&offset=0&query=#{params[:search]}",
  headers:{
    "X-Mashape-Key" => "OOLh4hg0Jkmsh9pPfNOOIYnCTqmGp15RBhSjsn9qaLqenGvhyS",
    "Accept" => "application/json"
  })
  @recipe_results = @search_result["results"]
  @recipe_id = @recipe_results.map{|recipe| recipe["id"]}
  @recipe_name = @recipe_results.map{|recipe| recipe["title"]}
  @recipe_time = @recipe_results.map{|recipe| recipe["readyInMinutes"]}
  @recipe_pic = @recipe_results.map{|recipe| recipe["image"]}

else
  flash.now[:danger] ="Could not find any recipes matching your search!"
end
end
def search_all
   if params[:search]
   @search_result = HTTParty.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?instructionsRequired=false&limitLicense=false&number=10&offset=0&query=#{params[:search]}",
 headers:{
   "X-Mashape-Key" => "OOLh4hg0Jkmsh9pPfNOOIYnCTqmGp15RBhSjsn9qaLqenGvhyS",
   "Accept" => "application/json"
 })
 @recipe_results = @search_result["results"]
 @recipe_id = @recipe_results.map{|recipe| recipe["id"]}
 @recipe_name = @recipe_results.map{|recipe| recipe["title"]}
 @recipe_time = @recipe_results.map{|recipe| recipe["readyInMinutes"]}
 test = @recipe_results.map{|recipe| recipe["imageUrls"]}
 @pic = test[0][0]

else
 flash.now[:danger] ="Could not find any recipes matching your search!"
end
end

private
def search_random(id)
  @response = HTTParty.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random?limitLicense=false&number=10", headers:{"X-Mashape-Key" => "lIOsRhZMTKmshyZ09B79rcDrwYNJp1gIzZmjsnPFBdpnDRnySc","Accept" => "application/json"})
  @recipes = @response["recipes"]
end



end
