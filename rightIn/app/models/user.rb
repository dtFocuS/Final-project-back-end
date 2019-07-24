class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :activities
    has_many :participations
    accepts_nested_attributes_for :activities
end
