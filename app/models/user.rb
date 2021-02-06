class User < ApplicationRecord
    has_many :trips, dependent: :destroy
    has_many :parks, through: :trips
    has_secure_password
end
