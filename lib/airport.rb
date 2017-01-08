require_relative 'plane'
require_relative 'weather'

class Airport

    
    def initialize(weather = Weather.new)
        @weather = weather
    end
    
    def stormy?
        @weather.stormy?
    end
    
    private
    
    attr_reader :weather
end