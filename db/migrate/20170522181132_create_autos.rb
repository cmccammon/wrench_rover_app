class CreateAutos < ActiveRecord::Migration[5.0]
  def change
    create_table :autos do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :trim
      t.string :image

      t.timestamps
    end
  end
end
