require_relative 'plane'

class Airport

    def initialize
        @plane_storage = []
    end 
    
    def land(plane)
        @plane_storage << plane
    end 

    def plane_count 
        @plane_storage.count
    end 
end 