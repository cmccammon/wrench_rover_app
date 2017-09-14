class AddRequestToRequestServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :request_services, :service, foreign_key: true
    remove_column :request_services, :service, :string
  end
end
