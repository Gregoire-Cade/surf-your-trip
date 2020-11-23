class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :location, :string
    add_column :users, :bio, :text
  end
end
