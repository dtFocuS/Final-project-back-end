class Participation < ApplicationRecord
    belongs_to :activity
    belongs_to :user

    def self.my_participating_activity_ids(user_id)
        my_participations = Participation.all
        my_participations = my_participations.select {|participation| participation.user_id === user_id.to_i}
        my_participating_activity_ids = my_participations.collect {|participation| participation.activity_id}

    end
end