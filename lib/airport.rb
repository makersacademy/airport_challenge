require_relative "plane"

class Airport
attr_accessor :airport
attr_accessor :capacity

 def initialize(capacity)
   @airport = []
   @capacity = capacity
 end

 def land(planes)
   fail "Airport is full" if full?
   @airport << planes
 end

 def take_off
   fail "there are no more planes in the airport" if empty?
   @airport.pop
 end


 def empty?
   @airport.empty?
 end

 def full?
   @airport.count >= capacity
 end
end
