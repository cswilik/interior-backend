class User < ApplicationRecord
    has_many :trips
    has_many :parks, through: :trips
    has_secure_password
end
