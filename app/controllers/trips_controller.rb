class TripsController < ApplicationController

    def index 
        trips = Trip.all
        render json: trips
    end 

    def show 
        trip = Trip.find(params[:id])
        render json: trip
    end 


    private 

    def trip_params 
        params.permit(:user_id, :park_id, :length_of_trip, :review, :img_url, :likes)
    end 
end
