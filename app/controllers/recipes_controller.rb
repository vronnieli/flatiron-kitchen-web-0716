require 'pry'
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.create(recipe_params)
    # @recipe.ingredients
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all

  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients = []
     @recipe.update(recipe_params)
    #
    # recipe_params[:ingredient_ids].each do |ingredientid|
    #   @recipe.ingredients << Ingredient.find(ingredientid)
    #   @recipe.save
    # end
    # @recipe.ingredient_ids.update

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
