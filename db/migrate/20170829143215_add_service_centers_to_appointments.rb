class AddServiceCentersToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :service_center, foreign_key: true
  end
end
