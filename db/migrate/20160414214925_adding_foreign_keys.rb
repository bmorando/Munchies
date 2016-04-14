class AddingForeignKeys < ActiveRecord::Migration
  def change

    add_foreign_key "comments", "posts"
    add_foreign_key "comments", "users"
    add_foreign_key "posts", "users"


  end
end

