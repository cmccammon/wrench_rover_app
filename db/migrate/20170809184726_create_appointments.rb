class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :selected_appointment
      t.references :quote, foreign_key: true

      t.timestamps
    end

    remove_column :quotes, :appointment_selected, :string
  end
end
