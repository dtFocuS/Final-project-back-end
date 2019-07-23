class Api::V1::ParticipationsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        participations = Participation.all 
        render json: participations
    end
end
