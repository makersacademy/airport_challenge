require_relative 'plane'

 class Airport
   attr_reader :planes
   attr_reader :weather
   attr_reader :capacity

   DEFAULT_CAPACITY = 20

   def initialize(capacity = DEFAULT_CAPACITY)
     @planes = []
     @capacity = capacity
     if rand(10) > 8
       @weather = :stormy
     else
       @weather = :sunny
     end
   end

   def full?
     @planes.size >= capacity
   end

   def let_plane_land(plane)
     fail "cannot land due to stormy weather" if weather == :stormy
     fail "cannot land as airport is full" if full?
     @planes << plane
   end

   def take_off
     fail "cannot take off due to stormy weather" if weather == :stormy
     @planes.pop
   end

 end
