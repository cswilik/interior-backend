class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :lat, :long, :entrance_fees, :img_url, :weather, :trips, :users
end
