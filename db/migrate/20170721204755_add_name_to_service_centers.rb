class AddNameToServiceCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :service_centers, :first_name, :string
    add_column :service_centers, :last_name, :string
    add_column :service_centers, :service_center_name, :string
    add_column :service_centers, :address, :string
    add_column :service_centers, :address2, :string
    add_column :service_centers, :city, :string
    add_column :service_centers, :state, :string
    add_column :service_centers, :zipcode, :integer
    add_column :service_centers, :phone_number, :integer
    add_column :service_centers, :country, :string
    add_column :service_centers, :url, :string
  end
end
