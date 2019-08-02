class Api::V1::ParticipationsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :my_participations, :participation, :destroy]

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

    def destroy
        
        participation = Participation.find_by(id: params[:id])
        
        if participation.destroy
            render json: ParticipationSerializer.new(participation)
        else
            #byebug
            puts error.full_message
        end
    end

    # def my_joined_activities
    #     my_participations = self.my_participations(params[:id])
    #     my_participating_activity_ids = my_participations.collect {|participation| participation.activity_id}
    #     my_participated_activities = Activity.where(activity_id: my_participating_activity_ids)
    #     render json: my_participated_activities

    # end
 
    private
 
    def participation_params
        params.require(:participation).permit(:activity_id, :user_id)
    end
end
