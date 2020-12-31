class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        result = ["Sorry."]
        if attraction.tickets.to_i > user.tickets.to_i.to_i
          result << "You do not have enough tickets to ride the #{attraction.name}."
        end
        if attraction.min_height.to_i > user.height.to_i
          result << "You are not tall enough to ride the #{attraction.name}."
        end
        if result.count > 1
          result.join(' ')
        else
          user.tickets -= attraction.tickets.to_i
          user.nausea += attraction.nausea_rating.to_i
          user.happiness += attraction.happiness_rating.to_i
          user.save
          "Thanks for riding the #{attraction.name}!"
        end
    end
end
