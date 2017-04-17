require_relative 'plane'

 class Airport
   DEFAULT_CAPACITY = 50
   attr_reader :planes

   def initialize(capacity = DEFAULT_CAPACITY)
     @capacity = capacity
     @planes = []
   end

   def land(plane)
     raise("The airport is at maximum capacity") if @planes.length >= @capacity
      @planes << plane
    end


   def takeoff
      raise RuntimeError, ("Airport empty") if @planes = []
      @planes.pop
    end
end
