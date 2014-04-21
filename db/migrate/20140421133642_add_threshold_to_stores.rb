class AddThresholdToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :threshold, :integer
  end
end
