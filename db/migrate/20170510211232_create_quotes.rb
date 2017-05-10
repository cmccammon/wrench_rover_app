class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.decimal :cost
      t.string :comment
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
