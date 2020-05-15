require "json"
require "byebug"
require "rest-client"
Recipe.destroy_all
Ingredient.destroy_all

api_key=Rails.application.credentials.spoonacular[:api_key]
response_recipe =RestClient.get("https://api.spoonacular.com/recipes/random?number=10&apiKey=#{api_key}")
recipes = JSON.parse(response_recipe)
recipe_array = recipes['recipes']

recipe_array.each do |recipe|
    title = recipe['title']
    cook_time = recipe['readyInMinutes']
    instructions = recipe['instructions']
    picture = recipe['image']
    health_score = recipe['healthScore']
    gluten_free = recipe['glutenFree']
    vegetarian = recipe['vegetarian']
    vegan = recipe['vegan']
    dairy_free = recipe['dairyFree']
    Recipe.create(title: title, cook_time: cook_time, instructions: instructions, picture: picture, health_score: health_score, gluten_free: gluten_free, vegetarian: vegetarian, vegan: vegan, dairy_free: dairy_free)
  end

roasted_chicken = Recipe.find_or_create_by(title: "Roasted Chicken",cook_time: 30, instructions: "Roast in the oven", picture: "picture", health_score: 20, gluten_free: true, vegetarian: false, vegan: false, dairy_free: true)
chicken = Ingredient.find_or_create_by(name:"Chicken", amount: 1.0, unit: "whole")
garlic = Ingredient.find_or_create_by(name:"Garlic", amount: 1.0, unit: "clove")
sugar = Ingredient.find_or_create_by(name:"Sugar", amount: 1.0, unit: "tsp")
apflour = Ingredient.find_or_create_by(name:"All purpose flour", amount: 1.0, unit: "cup")
milk = Ingredient.find_or_create_by(name:"Whole Milk", amount: 0.5, unit: "cup")
egg = Ingredient.find_or_create_by(name:"Egg", amount: 1.0, unit: "each")
salt = Ingredient.find_or_create_by(name:"Kosher Salt", amount: 1.0, unit: "tsp")
cinnamon = Ingredient.find_or_create_by(name:"Ground Cinnamon", amount: 1.0, unit: "tsp")
RecipeIngredient.find_or_create_by(recipe_id: roasted_chicken.id , ingredient_id: sugar.id)
RecipeIngredient.find_or_create_by(recipe_id: roasted_chicken.id , ingredient_id: garlic.id)
RecipeIngredient.find_or_create_by(recipe_id: roasted_chicken.id , ingredient_id: chicken.id)