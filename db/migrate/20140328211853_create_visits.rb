class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :visitdate
      t.text :note
      t.integer :user_id
      t.integer :store_id

      t.timestamps
    end
  end
end
