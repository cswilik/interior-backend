class AddMoreColumnsToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :accommodations, :string
    add_column :trips, :what_to_pack, :string
  end
end
