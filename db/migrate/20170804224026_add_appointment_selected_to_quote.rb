class AddAppointmentSelectedToQuote < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :appointment_selected, :string
  end
end
