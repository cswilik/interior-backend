class AuthController < ApplicationController

    def login
      user = User.last
      render json: user
    end
    
end 