class RemoveReferanceFromServices < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:services, :service_category, index: true)
  end
end
