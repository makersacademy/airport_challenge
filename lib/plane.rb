require_relative 'airport'

class Plane
    attr_reader :airport
    attr_reader :landed
    
    def initialize
        @landed = false
        @airport = :flying
    end
    
    def land(airport)
        @landed = true
        @airport = airport
    end
    
    def take_off
        @landed = false
        @airport = :flying
    end
    
    #def landed?
    #    @landed
    #end
end