class RemoveServiceAndDescriptionFromRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :service, :string
    remove_column :requests, :description, :string
  end
end
