require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :weather, :capacity

   def initialize(capacity = DEFAULT_CAPACITY)
     @capacity = capacity
     @planes = []
     @weather = weather
   end

   def land(plane)
     raise("The airport is at maximum capacity") if full?
     raise RuntimeError, "The flight is canceled due to stormy weather" if stormy_weather?
     @planes << plane
   end

   def takeoff
     fail "The flight is canceled due to stormy weather" if stormy_weather?
     @planes.pop
   end

   private

    def full?
      @planes.length >= @capacity
    end

    def stormy_weather?
    rand(1..10) == 5
    end
end
