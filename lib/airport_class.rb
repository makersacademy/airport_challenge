class Airport 
    def initialize
        @plane
        @landed = []
    end     
    def land(plane)
        @plane = plane
        @landed << @plane
    end   
    def take_off(plane)
        @plane = plane
        "Plane has taken off"
    end  
end
