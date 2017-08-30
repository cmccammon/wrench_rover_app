class AddCompletedToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :completed, :boolean, null: false, default: false
  end
end
