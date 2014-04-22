class ChangeSubField < ActiveRecord::Migration
  def change
  	remove_column :users, :subscribed, :boolean
  	add_column :users, :subscribed, :integer
  end
end
