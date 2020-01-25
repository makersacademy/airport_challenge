require_relative 'plane'

class Airport

    def initialize
        @plane_storage = []
    end 

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
        @plane_storage.count >= 10 
    end

end 