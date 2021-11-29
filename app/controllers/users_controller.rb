class UsersController < ApplicationController
    before_action :authorize, only: [:dashboard, :update]

    def index 
        users = User.all
        render json: users
    end 

    def show 
        user = User.find(params[:id])
        render json: user
    end 


    def update 
        @user.update(user_params)
        render json: @user
    end 

    def create
        user = User.create(user_params)
        render json: user
    end 


    def dashboard
        @user.update(user_params)
        render json: @user
    end 

    def authorize 
        @user = AuthorizeRequest.new(request.headers).user
        unless @user
            render json: { error: "not authorized!"}, status: :unauthorized
        end 
    end 

    private 
    def user_params 
        params.permit(:id, :email, :name, :password, :bio, :fav_park)
    end 
end
