class RemoveNameIndexFromServiceCategories < ActiveRecord::Migration[5.0]
  def change
    remove_index :service_categories, :name
  end
end
