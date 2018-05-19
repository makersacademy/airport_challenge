require_relative 'plane'

 class Airport
   attr_reader :planes

   def initialize
     @planes = []
   end

   def let_plane_land(plane)
     @planes << plane
   end

   def take_off
     @planes.pop
   end

 end
