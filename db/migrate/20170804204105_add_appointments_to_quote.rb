class AddAppointmentsToQuote < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :appointment1, :datetime
    add_column :quotes, :appointment2, :datetime
    add_column :quotes, :appointment3, :datetime
  end
end
