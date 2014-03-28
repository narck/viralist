class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :phone
      t.string :email
      t.integer :company_id

      t.timestamps
    end
  end
end
