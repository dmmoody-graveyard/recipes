class CreateCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)
    end
    add_index(:categories_recipes, :category_id)
    add_index(:categories_recipes, :recipe_id)
  end
end
