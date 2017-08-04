class AddPhoneNumberToServiceCenters < ActiveRecord::Migration[5.0]
  def change
    change_column :service_centers, :phone_number, :string
  end
end
