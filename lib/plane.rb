require_relative 'airport'

class Plane
    attr_reader :airport
    attr_reader :landed
    
    def initialize
        @landed = false
        @airport = :flying
    end
    
    def land(airport)
        landing_errors(airport)
        @landed = true
        park(airport)
    end
    
    def take_off
        take_off_errors
        leave
        @landed = false
        @airport = :flying
    end
    
    private
    
    def landing_errors(airport)
        raise "Plane already landed" if @landed
        raise "Airport full" if full?(airport)
        raise "Too stormy to land" if airport.stormy?
    end
    
    def take_off_errors
        raise "Plane already flying" unless @landed
        raise "Too stormy to take off" if airport.stormy?
    end
    
    def park(airport)
        airport.planes << :plane
        @airport = airport
    end
    
    def leave
        @airport.planes.pop
    end
    
    def full?(airport)
        airport.planes.count >= airport.capacity
    end
end