require_relative 'plane'

class Airport
    attr_accessor :airport_capacity
    
    def initialize(capacity = 10)
        @plane_storage = []
        @airport_capacity = capacity
    end 

    # def change_airport_capacity(number)
    #     @airport_capacity = number
    # end 

    def land(plane)
        fail 'no space available' if full?
        @plane_storage << plane
    end 

    def plane_count 
        @plane_storage.count
    end 

    def take_off
        @plane_storage.drop(1)
    end 

    def full?
        @plane_storage.count >= @airport_capacity
    end

end 