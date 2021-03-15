require_relative 'plane'
require_relative 'weather' 

class Controller
    def plane (plane)
        # This should be edited so that each plane called is 
        # is one of 20 that are registered at the aiport
        @plane = Plane.new
    end

    def safe_landing(plane)
      weather = Weather.new
      weather.stormy?? (fail 'unsafe conditions') : (@plane.land)
    
    end

    def safe_takeoff(plane)
      weather = Weather.new
      weather.stormy?? (fail 'unsafe conditions') : (@plane.takeoff)
    end

end