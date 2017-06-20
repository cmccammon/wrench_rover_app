class CreateRequestServices < ActiveRecord::Migration[5.0]
  def change
    create_table :request_services do |t|
      t.string :service
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
