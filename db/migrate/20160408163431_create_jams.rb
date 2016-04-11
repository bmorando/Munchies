class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.string :description
      t.string :location
      t.datetime :time
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
