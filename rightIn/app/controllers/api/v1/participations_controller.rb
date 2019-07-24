class Api::V1::ParticipationsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        participations = Participation.all 
        render json: participations
    end

    def create
        participation = Participation.create(participation_params)
        if participation.valid?
            render json: { participation: ParticipationSerializer.new(participation) }, status: :created
        else
            render json: { error: 'failed to create participation' }, status: :not_acceptable
        end
    end
 
    private
 
    def participation_params
        params.require(:participation).permit(:activity_id, :user_id)
    end
end
