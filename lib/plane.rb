require_relative 'airport'

class Plane
    attr_reader :airport
    attr_reader :landed
    
    def initialize
        @landed = false
        @airport = :flying
    end
    
    def land(airport)
        #raise "Can only land at an airport" unless airport.instance_of?(Airport)
        raise "Plane already landed" if @landed
        raise "Airport full" if full?(airport)
        raise "Too stormy to land" if airport.stormy?
        @landed = true
        @airport = airport
        park
    end
    
    def take_off
        raise "Plane already flying" unless @landed
        raise "Too stormy to take off" if airport.stormy?
        un_park
        @landed = false
        @airport = :flying
    end
    
    private
    
    def park
        @airport.planes << self
    end
    
    def un_park
        @airport.planes.delete(self)
    end
    
    def full?(airport)
        airport.planes.count >= airport.capacity
    end
end