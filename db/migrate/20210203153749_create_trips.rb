class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :park, null: false, foreign_key: true
      t.string :length_of_trip
      t.string :review
      t.string :img_url
      t.integer :likes

      t.timestamps
    end
  end
end
