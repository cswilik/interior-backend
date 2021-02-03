class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :description
      t.string :location
      t.float :lat
      t.float :long
      t.string :entrance_fees
      t.string :img_url

      t.timestamps
    end
  end
end
