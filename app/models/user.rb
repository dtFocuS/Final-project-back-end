class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :username, uniqueness: { case_sensitive: false }, presence: true
    has_many :activities, dependent: :destroy
    has_many :participations, dependent: :destroy
    accepts_nested_attributes_for :activities

    def self.get_participants(activity_id)
        participations = Participation.all.filter{|participation| participation.activity_id == activity_id.to_i}
        participants_id = participations.map{|participation| participation.user_id.to_i}
        participants_id
    end
end
