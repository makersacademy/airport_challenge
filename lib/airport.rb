require_relative 'airplane'

class Airport 
    def initialize 
        @garage = []
    end
    def land_plane(airplane)
        @garage << airplane
    end

    def take_off(airplane)
     @garage.delete(airplane)   

    end

    
end
