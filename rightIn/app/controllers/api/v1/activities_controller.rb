class Api::V1::ActivitiesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]


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
 
    private
 
    def activity_params
        params.require(:activity).permit(:name, :description, :user_id, :latitude, :longitude)
    end
end
