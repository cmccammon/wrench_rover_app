class AddCompletedToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :completed, :boolean, null: false, default: false
  end
end
