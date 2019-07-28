class Activity < ApplicationRecord
    belongs_to :user
    has_many :participations, dependent: :destroy


    def self.others_activitiy_ids(current_user_id)
        others_activities = Activity.all.filter{|activity| activity.user_id != current_user_id.to_i}
        others_activitiy_ids = others_activities.map {|activity| activity.id}
    end
end
