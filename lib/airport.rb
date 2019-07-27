require_relative 'plane'
class AirportController

    #the land methods creates instances of planes
    def land(plane)
    # this is an instance variable to store planes
      @plane = plane
    end

    #the plane thats landed is added to this method called plane
    #which will return the plane thats landed
    def plane
        @plane
    end

end