class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        # binding.pry
        unless admin
            if happiness > nausea
                "happy"
            else
                "sad"
            end
        end
    end
end

