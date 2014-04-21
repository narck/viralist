class AddPrimaryContactToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :primary_contact_id, :integer
  end
end
