class AddDefaultValueToWavesToSpot < ActiveRecord::Migration[6.0]
  def change
    change_column :spots, :waves, :integer, default: 0
  end
end
