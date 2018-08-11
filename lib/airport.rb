require_relative 'plane'
# require_relative 'weather'

class Airport

    attr_reader :hangar
    
    def initialize 
        @hangar = []
    end

    def land(plane)
        @hangar << plane
    end

    def take_off(plane)
    end

end 