class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :level
      t.string :location
      t.integer :waves
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
