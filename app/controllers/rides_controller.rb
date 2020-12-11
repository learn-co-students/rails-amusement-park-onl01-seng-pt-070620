class RidesController < ApplicationController
    def create
      @user = User.find(current_user)
      @attraction = Attraction.find(params[:attraction_id])
      @ride = @attraction.rides.create(user_id: current_user)
      @ride.save
      @message = @ride.take_ride
      redirect_to user_path(@user), :flash => { :notice => @message }
    end
  
    def find_attraction
      Attraction.find_by(id: params[:attraction_id])
    end
  
  end