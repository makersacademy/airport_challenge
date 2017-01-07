class Plane
    def initialize
        @landed = false
    end
    
    def land(airport)
        @landed = true
        airport
    end
    
    def take_off
        @landed = false
    end
    
    def landed?
        @landed
    end
    
    private
    
    attr_reader :landed
end