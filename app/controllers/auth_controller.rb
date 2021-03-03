class AuthController < ApplicationController

    def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        secret = Rails.application.secrets.secret_key_base
        token = JWT.encode({user_id: user.id}, secret, "HS256")
        render json: {user: UserSerializer.new(user), token: token}
      else 
        render json: {error: "invalid email or password"}
      end 
    end

    def signup 
      signup_params= params.permit(:email, :password, :name, :bio, :fav_park)
      user = User.create(signup_params)
      if user.valid?
        secret = Rails.application.secrets.secret_key_base
        token = JWT.encode({user_id: user.id}, secret, "HS256")
        render json: {user: UserSerializer.new(user), token: token}
      else 
        render json: { error: user.errors.full_messages}
      end 
    end 

  
    
end 