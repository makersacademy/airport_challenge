require_relative 'plane'
class Airport
    attr_reader :planes
    def initialize
        @planes = []
    end
    def land(plane)
        @planes << plane
    end
    def take_of(plane)
         
        @planes.delete(plane)
        
        
    end
end
