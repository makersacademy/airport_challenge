# require_relative 'plane'

class Airport
  
    def initialize(capacity)
     @capacity = capacity
     @planes = []
    end

    def land(plane)
        raise "Full to capacity: Landing Denied" if @planes.length >= @capacity
        @planes << plane
    end
        
    def take_off(airport)
    end


end
