require_relative 'airport'

class Plane
    attr_reader :airport
    attr_reader :landed
    
    def initialize
        @landed = false
        @airport = :flying
    end
    
    def land(airport)
        raise "Plane already landed" if @landed
        raise "Too stormy to land" if airport.stormy?
        @landed = true
        @airport = airport
    end
    
    def take_off
        raise "Plane already flying" unless @landed
        raise "Too stormy to take off" if airport.stormy?
        @landed = false
        @airport = :flying
    end
end