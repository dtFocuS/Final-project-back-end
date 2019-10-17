class Activity < ApplicationRecord
    belongs_to :user
    has_many :participations, dependent: :destroy


    def self.others_activitiy_ids(current_user_id)
        others_activities = Activity.all.filter{|activity| activity.user_id != current_user_id.to_i}
        others_activitiy_ids = others_activities.map {|activity| activity.id}
    end

    def self.other_not_joined_activities(current_user_id)
        my_participations = Participation.all.filter{|participation| participation.user_id == current_user_id.to_i}
        my_participating_activity_ids = my_participations.map {|participation| participation.activity_id.to_i}
        other_activities = Activity.all.filter{|activity| activity.user_id != current_user_id.to_i}
        temp = [];
        other_activities.each do |activity|
            joined = false
            my_participating_activity_ids.each do |activity_id|
                if (activity.id == activity_id) 
                    joined = true
                end
            end
            if (!joined)
                temp.push(activity)
            end
        end
        temp
    end

    def return_participants(activity_id)
        Activity.find(activity_id).participations.map{|participation| participation.user_id.to_i}
    end
end
