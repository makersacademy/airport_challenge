require_relative "plane"

class Airport
attr_reader :airport

 def initialize
   @airport = []
 end

 def land(planes)
   @airport << planes
 end

 def take_off
   fail "there are no more planes in the airport" if empty?
   @airport.pop
 end


 def empty?
   @airport.empty?
 end 

end
