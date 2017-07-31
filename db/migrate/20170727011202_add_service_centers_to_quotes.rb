class AddServiceCentersToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :quotes, :service_center, foreign_key: true
  end
end
