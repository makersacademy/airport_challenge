#require './lib/plane'
class Airport
 attr_reader :landedplanes_register
 attr_reader :capacity

 @@planes_inflight = Array.new
 #@@airport_register = Hash.new



 def initialize(capacity = 10)
  @capacity = capacity
  @landedplanes_register = []
 end

 def land_plane(plane, weather)
   raise "Bad Weather" unless weather == "sunny"
   raise "Airport out of capacity cannot land the plane" unless @landedplanes_register.count < @capacity
     if plane != nil
       raise "Cannot land an already landed plane" unless !@landedplanes_register.include?(plane)
       @landedplanes_register.push(plane)
       @@planes_inflight.delete(plane) if @@planes_inflight.include?(plane)
       plane.land
     else
       "Specify which plane to land"
     end
 end

def take_off(plane, weather)
  raise "Bad Weather" unless weather == "sunny"
  if plane != nil
    @landedplanes_register.delete(plane) if @landedplanes_register.include?(plane)
    @@planes_inflight.push(plane)
    plane.take_off
  end
end


end
