class AddLocationDataToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :address, :string
  	add_column :stores, :city, :string
  	add_column :stores, :zip, :string

  end
end
