require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULY_CAPACITY = 20
  attr_reader :airport, :weather

    def initialize(capacity = DEFAULY_CAPACITY)
        @airport = []
        @weather = Weather.new
        @capacity = capacity
    end

    def land_plane(plane)
      raise "weather is not suitable for landing" if stormy?
      raise "Airport is full" if full?
      @airport << plane
    end

    def take_off
       raise "weather is not suitable for take off" if stormy?
       @airport.pop
    end

    def full?
       @airport.size >= @capacity
    end

    def stormy?
      weather.stormy?
    end

end
