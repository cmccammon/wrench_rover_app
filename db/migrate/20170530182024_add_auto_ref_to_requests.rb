class AddAutoRefToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :auto, foreign_key: true
  end
end
