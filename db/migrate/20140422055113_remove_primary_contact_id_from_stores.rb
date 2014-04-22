class RemovePrimaryContactIdFromStores < ActiveRecord::Migration
  def change
  	remove_column :stores, :primary_contact_id
  end
end
