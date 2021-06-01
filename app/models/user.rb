class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    has_secure_password

    def mood
        #binding.pry
        unless self.admin
            if self.happiness >= self.nausea
                'happy'
            else
                'sad'
            end
        end
    end
end
