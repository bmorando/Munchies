class RemoveTable < ActiveRecord::Migration
  def change
    drop_table :jams
  end
end
