class ChangeSubFieldBool < ActiveRecord::Migration
  def change
  	remove_column :users, :subscribed, :integer
    add_column :users, :subscribed, :boolean, default: true
  end
end
