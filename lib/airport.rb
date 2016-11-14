require 'weather.rb'

class Airport

  attr_reader :weather, :capacity, :planes
  Default_Capacity = 10

    def initialize(capacity = Default_Capacity)
      @capacity = capacity
      @weather = Weather.new
      @planes = []
    end

    def is_fair_weather?
      weather.condition == :sunny
    end

    def is_full?
      airport.count >= capacity
    end

    def land(plane)
      plane.land
      planes << plane
    end

    def take_off(plane)
      planes.delete(plane)
    end
end
