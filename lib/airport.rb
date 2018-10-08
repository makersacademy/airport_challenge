#require './lib/plane'
class Airport
 attr_reader :landedplanes_register
 attr_reader :capacity


 @@planes_inflight = Array.new
 #@@airport_register = Hash.new



 def initialize(capacity = 10)
  @capacity = capacity
  @landedplanes_register = Hash.new
 end

 def land_plane(plane, weather)
   raise "Bad Weather" unless weather == "sunny"
   raise "Airport out of capacity cannot land the plane" unless @landedplanes_register.length < @capacity
     if plane != nil
       raise "Cannot land an already landed plane" unless !@landedplanes_register.include?(plane)
       #@landedplanes_register.push(plane)
       @landedplanes_register[@landedplanes_register.length+1] = plane
       @@planes_inflight.delete(plane) if @@planes_inflight.include?(plane)
       plane.land
     else
       "Specify which plane to land"
     end
 end

def take_off(id, weather)
  raise "Bad Weather" unless weather == "sunny"
  raise "No more planes left to take off, call land planes before initiating take offs" if @landedplanes_register.count == 0
  str = @landedplanes_register[id]
  raise "Cannot take-off plane already in flight" if str == nil
  if id != nil    
    @@planes_inflight.push(str)
    @landedplanes_register.delete(id) if @landedplanes_register.include?(id)
    str.take_off
  end
end

def stats
  stats = ""
  stats << "Default Capacity #{@capacity} :: Outstanding #{@capacity - @landedplanes_register.count}\n"
  stats << "**********************************************\n"
  stats << "List of planes :: #{@landedplanes_register}\n"
  stats << "**********************************************\n"
  stats << "planes in flight :: #{@@planes_inflight}\n"
  stats << "**********************************************"
  puts stats
end

end
