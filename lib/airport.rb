require_relative "plane"

class Airport
attr_accessor :airport
attr_accessor :capacity

 def initialize(capacity)
   @airport = []
   @capacity = capacity
 end

 def land(planes)
   stormy?
   fail "Airport is full" if full?
   fail "conditions are stormy" if stormy? == "stormy"
   if stormy? == "sunny"
     @airport << planes
   end
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

 def stormy?
   ran_num = rand(1..2)
   if ran_num == 1
     return "stormy"
   elsif ran_num == 2
     return "sunny"
   end
 end
end
