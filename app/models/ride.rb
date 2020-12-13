class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    accepts_nested_attributes_for :user

    def take_ride
        if ticket_requirement && height_requirement
            current_tickets = self.user.tickets - self.attraction.tickets
            current_happiness = self.user.happiness + self.attraction.happiness_rating
            current_nausea = self.user.nausea + self.attraction.nausea_rating 
            self.user.update(
                :tickets => current_tickets,
                :happiness => current_happiness,
                :nausea => current_nausea
            )
            "Thanks for riding the #{self.attraction.name}!"
        elsif 
            ticket_requirement && !height_requirement 
            "Sorry. " + not_tall_enough
        elsif
            !ticket_requirement && height_requirement 
            "Sorry. " + not_enough_tickets
        elsif
            !ticket_requirement && !height_requirement 
            "Sorry. " + not_enough_tickets + " " + not_tall_enough
        end
    end


    def height_requirement
        self.user.height >= self.attraction.min_height
    end

    def ticket_requirement
        self.user.tickets >= self.attraction.tickets
    end

    def not_tall_enough
        attraction = self.attraction
        "You are not tall enough to ride the #{attraction.name}."
    end

    def not_enough_tickets
        attraction = self.attraction
        "You do not have enough tickets to ride the #{attraction.name}."
    end

end
