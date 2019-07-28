class Api::V1::ParticipationsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :my_participations, :my_joined_activities]

    def index
        participations = Participation.all 
        render json: participations
    end

    def show 
        participation = Participation.find_by(id: params[:id])
        render json: { participation: ParticipationSerializer.new(participation) }

    end

    def create
        participation = Participation.create(participation_params)
        if participation.valid?
            render json: { participation: ParticipationSerializer.new(participation) }, status: :created
        else
            render json: { error: 'failed to create participation' }, status: :not_acceptable
        end
    end

    def my_joined_activities
        #byebug
        my_participations = self.my_participations(params[:id])
        #byebug
        my_participating_activity_ids = my_participations.collect {|participation| participation.activity_id}
        #byebug
        my_participated_activities = Activity.where(activity_id: my_participating_activity_ids)
        #byebug
        render json: my_participated_activities

    end
 
    private
 
    def participation_params
        params.require(:participation).permit(:activity_id, :user_id)
    end
end
