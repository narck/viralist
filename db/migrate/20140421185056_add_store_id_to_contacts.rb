class AddStoreIdToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :store_id, :integer
  end
end
