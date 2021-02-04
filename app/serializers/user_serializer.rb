class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :password_digest, :bio, :fav_park, :trips, :parks
end
