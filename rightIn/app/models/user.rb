class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :activities, dependent: :destroy
    has_many :participations
    accepts_nested_attributes_for :activities

    def self.get_participants(activity_id)
        participations = Participation.all.filter{|participation| participation.activity_id == activity_id.to_i}
        participants_id = participations.map{|participation| participation.user_id.to_i}
        participants_id
    end
end
