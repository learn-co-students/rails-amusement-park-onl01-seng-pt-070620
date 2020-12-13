class RidesController < ApplicationController

    def new
        @ride = Ride.new
    end

    def create
        @ride = Ride.new(ride_params)
        if @ride.save
            message = @ride.take_ride
            flash[:message] = message
            redirect_to user_path(@ride.user)
        end
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
