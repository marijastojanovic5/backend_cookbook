require "json"
require "byebug"
require "rest-client"
Recipe.destroy_all
Ingredient.destroy_all

api_key=Rails.application.credentials.spoonacular[:api_key]
response_recipe =RestClient.get("https://api.spoonacular.com/recipes/random?number=500&apiKey=#{api_key}")
recipes = JSON.parse(response_recipe)
recipe_array = recipes['recipes']

recipe_array.each do |recipe|
    title = recipe['title']
    rating = recipe['aggregateLikes']
    cook_time = recipe['readyInMinutes']
    instructions = recipe['instructions']
    picture = recipe['image']
    health_score = recipe['healthScore']
    gluten_free = recipe['glutenFree']
    vegetarian = recipe['vegetarian']
    vegan = recipe['vegan']
    dairy_free = recipe['dairyFree']
    Recipe.create(title: title, rating: rating, cook_time: cook_time, instructions: instructions, picture: picture, health_score: health_score, gluten_free: gluten_free, vegetarian: vegetarian, vegan: vegan, dairy_free: dairy_free)
  end

  recipe_array.each do |recipe|
    recipe['extendedIngredients'].each do |ingredient|
        name= ingredient['name']
        amount= ingredient['amount']
        unit= ingredient['unit']
        Ingredient.create(name: name, amount: amount, unit: unit)
    end
end

 
  0