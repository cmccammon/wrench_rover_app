class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :service
      t.string :description

      t.timestamps
    end
  end
end
