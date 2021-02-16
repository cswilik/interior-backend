class AddMoreColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :junior_badge, :boolean
    add_column :users, :ranger_badge, :boolean
    add_column :users, :master_badge, :boolean
  end
end
