class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :profile, :get_participants]

    def index
        users = User.all
        render json: users
    end
 
    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def show
        user = User.find_by(id: params[:id])
        render json: { user: UserSerializer.new(user) }
    end
 
    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    # def get_participants
    #     participants_id = User.get_participants(params[:activity_id])
    #     render json: User.where(id: participants_id)
    # end
 
    private
 
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :image, :email)
    end
end
