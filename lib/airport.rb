require_relative 'plane'
require_relative 'weather'

class Airport
    DEFAULT_CAPACITY = 1
    
    attr_reader :capacity
    attr_reader :planes
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @weather = Weather.new
        @capacity = capacity
        @planes = []
    end
    
    def stormy?
        @weather.stormy?
    end
end