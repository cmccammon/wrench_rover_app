class AddAutoRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :autos, :user, foreign_key: true
  end
end
