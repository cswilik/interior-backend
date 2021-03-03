class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :bio, :fav_park, :junior_badge, :ranger_badge, :master_badge, :trips, :parks
end
