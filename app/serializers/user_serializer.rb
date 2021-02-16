class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :password_digest, :bio, :fav_park, :junior_badge, :ranger_badge, :master_badge, :trips, :parks
end
