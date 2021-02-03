class TripSerializer < ActiveModel::Serializer
  attributes :id, :length_of_trip, :review, :img_url, :likes
  has_one :user
  has_one :park
end
