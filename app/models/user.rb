class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        unless admin
            if happiness > nausea
                "happy" 
            else nausea > happiness
                "sad"
            end
        end
    end
end
