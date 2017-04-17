require_relative 'plane'
require_relative 'weather'

 class Airport
   DEFAULT_CAPACITY = 50
   attr_reader :planes, :weather, :capacity

   def initialize(capacity = DEFAULT_CAPACITY,weather = Weather.new)
     @capacity = capacity
     @planes = []
     @weather = weather
   end

   def land(plane)
     raise("The airport is at maximum capacity") if full?
     raise RuntimeError, "The landing is canceled due to stormy weather" if stormy?
      @planes << plane
    end


   def takeoff
      raise RuntimeError, ("Airport is empty") if !full?
      @planes.pop
    end

   private

      def full?
          @planes.length >= @capacity
      end
    def stormy?
      @weather.stormy_weather?
    end
end
