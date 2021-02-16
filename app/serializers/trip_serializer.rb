class TripSerializer < ActiveModel::Serializer
  attributes :id, :length_of_trip, :review, :img_url, :accommodations, :what_to_pack, :likes
  has_one :user
  has_one :park
end
