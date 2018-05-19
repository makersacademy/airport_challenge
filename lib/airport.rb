require_relative 'plane'

 class Airport
   attr_reader :planes
   attr_reader :weather

   def initialize
     @planes = []
     if rand(10) > 8
       @weather = :stormy
     else
       @weather = :sunny
     end
   end

   def let_plane_land(plane)
     fail "cannot land due to stormy weather" if weather == :stormy
     @planes << plane
   end

   def take_off
     fail "cannot take off due to stormy weather" if weather == :stormy
     @planes.pop
   end

 end
