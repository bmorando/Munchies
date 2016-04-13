class RemoveColumnsFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :recipes, :text
    remove_column :categories, :user_id, :string
  end
end
