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
        @landed = true
        @airport = airport
    end
    
    def take_off
        raise "Plane already flying" unless @landed
        @landed = false
        @airport = :flying
    end
end