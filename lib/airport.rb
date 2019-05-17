require 'weather'
class Airport
    attr_reader :planes
    def initialize
        @planes = []
        @weather = Weather.new
    end
    def weather?
        @weather.query
    end
    def land(plane)
        @planes.push(plane)
    end
end
