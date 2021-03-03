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

    # def dashboard 
    #     # read the token
    #     begin
    #         auth_headers = request.headers["Authorization"]
    #         token = auth_headers.split.last
    #         payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, {algorithm: 'HS256'})
    #         # get the user id from the payload
    #         user_id = payload[0]["user_id"]
    #         user = User.find(user_id)
    #         render json: user
    #     rescue
    #         render json: { error: "not authorized!"}, status: :unauthorized
    #     end 
    # end 

    def dashboard
        @user
    end 

    def authorize 
        @user = AuthorizeRequest.new(request.headers).user
        unless @user
            render json: { error: "not authorized!"}, status: :unauthorized
        end 
    end 

    private 
    def user_params 
        params.permit(:email, :name, :password, :bio, :fav_park, :junior_badge, :ranger_badge, :master_badge)
    end 
end
