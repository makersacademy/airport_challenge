require_relative 'plane'

 class Airport
   attr_reader :planes

   def initialize
     @planes = []
   end

   def land(plane)
     @planes.push(plane)
   end

   def take_off(plane)
     plane.report_take_off
     @planes.delete(plane)
   end

 end