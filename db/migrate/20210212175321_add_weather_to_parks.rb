class AddWeatherToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :weather, :string
  end
end
