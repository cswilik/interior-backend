class User < ApplicationRecord
    has_many :trips, dependent: :destroy
    has_many :parks, through: :trips
    has_secure_password
    validates :email, uniqueness: {case_sensitive: false}
end
