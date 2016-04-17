require_relative 'plane'

class Airport
    
    attr_reader :hangar, :weather
    
    def initialize
        @hangar = []
        if rand(4) == 0
            @weather = 'stormy'
        else
            @weather = 'sunny'
        end
    end
    
    def land(plane)
        raise 'It\'s too stormy to land!' if weather == 'stormy'
        hangar << plane
    end
    
    def take_off
        raise 'It\'s too stormy to launch a plane!' if weather == 'stormy'
        hangar.pop
    end
    


end