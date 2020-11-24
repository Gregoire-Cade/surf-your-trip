class AddDetailsToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :beach_type, :string
    add_column :spots, :about_location, :text
    add_column :spots, :punchline, :string
  end
end
