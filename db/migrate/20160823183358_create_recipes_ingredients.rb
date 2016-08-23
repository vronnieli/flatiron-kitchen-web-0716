class CreateRecipesIngredients < ActiveRecord::Migration
  def change
    create_table :recipes_ingredients do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true
    end
    add_foreign_key :recipes_ingredients, :recipes
    add_foreign_key :recipes_ingredients, :ingredients
  end
end
