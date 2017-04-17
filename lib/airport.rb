require_relative 'plane'

  class Airport

   DEFAULT_CAPACITY = 50
   attr_reader :planes

   def initialize(capacity = DEFAULT_CAPACITY)
     @capacity = capacity
     @planes = []
   end


   def land(plane)

     @planes << plane
   end

  def takeoff(plane)

     @planes.pop
   end
  end
