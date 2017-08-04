class ChangeZipcodeToZipCodeInServiceCenters < ActiveRecord::Migration[5.0]
  def change
    change_column :service_centers, :zipcode, :string
  end
end
