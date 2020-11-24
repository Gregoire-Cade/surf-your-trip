class AddDescriptionToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :description, :text
  end
end
