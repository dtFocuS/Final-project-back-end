class Api::V1::ActivitiesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :my_joined_activities, :others_activities, :other_not_joined_activities, :update, :destroy]


    def index
        activities = Activity.all
        render json: activities
    end

    def show
        activiy = Activity.find_by(id: params[:id])
        render json: ActivitySerializer.new(activity)
    end
 
    def create
        activity = Activity.create(activity_params)
        if activity.valid?
            render json: { activity: ActivitySerializer.new(activity) }, status: :created
        else
            render json: { error: 'failed to create activity' }, status: :not_acceptable
        end
    end

    def update
        activity = Activity.find_by(id: params[:id])
        if activity.update(activity_params)
            render json: { activity: ActivitySerializer.new(activity) }, status: :created
        else
            render json: { error: 'failed to edit activity' }, status: :not_acceptable
        end
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        #byebug
        if activity.destroy
            render json: { activity: ActivitySerializer.new(activity) }
        else
            #byebug
            puts error.full_message
        end
    end

    def get_participants
        # participants_id = Activity.return_participants(params[:activity_id])
        participants_id = Activity.find(params[:activity_id]).participations.map{|participation| participation.user_id.to_i}
        render json: User.where(id: participants_id)
    end

    def my_joined_activities
        my_activity_ids = Participation.my_participating_activity_ids(params[:current_user_id])
        my_participating_activities = Activity.where(id: my_activity_ids)
        render json: my_participating_activities
    end

    def others_activities
        others_activitiy_ids = Activity.others_activitiy_ids(params[:current_user_id])
        others_activities = Activity.where(id: others_activitiy_ids)
        render json: others_activities
    end

    def other_not_joined_activities
        
        render json: Activity.other_not_joined_activities(params[:current_user_id])
    end
 
    private
 
    def activity_params
        params.require(:activity).permit(:name, :description, :user_id, :latitude, :longitude, :address)
    end
end
