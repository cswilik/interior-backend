class TripsController < ApplicationController

    def index 
        trips = Trip.all
        render json: trips
    end 

    def show 
        trip = Trip.find(params[:id])
        render json: trip
    end 

    def create
        trip = Trip.create(trip_params)
        image = Cloudinary::Uploader.upload(params[:img_url])
        trip.update(img_url:image['url'])
        render json: trip
    end 



    def update 
        trip = Trip.find(params[:id])
        trip.update(trip_params)
        render json: trip
    end 

    def destroy
        trip = Trip.find(params[:id])
        trip.destroy
        render json: trip
    end

  



    private 

    def trip_params 
        params.permit(:user_id, :park_id, :length_of_trip, :review, :img_url, :likes)
    end 
end
