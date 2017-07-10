class AddMileageToAutos < ActiveRecord::Migration[5.0]
  def change
    add_column :autos, :mileage, :integer
  end
end
