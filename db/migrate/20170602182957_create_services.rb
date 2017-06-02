class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.references :service_category, foreign_key: true

      t.timestamps
    end
  end
end
