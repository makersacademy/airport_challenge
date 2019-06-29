require 'pry'
require_relative './plane.rb'

class Airport

attr_reader :planes
attr_reader :max_capacity

def initialize(max_capacity = 20)
  @max_capacity = max_capacity
  @planes = []
end

 def instruct_land(plane)
   if airport_full?
    raise("Error: Airport is full. find somewhere else to land")
   else 
    @planes.include?(plane) ? raise("Error: this plane has already landed") : planes << plane
   end
 end

 def instruct_take_off
    planes.empty? ? raise("Error: no planes in airport") : authorize
 end

 private

 def authorize
    puts "#{planes.pop} has successfully taken off" if !planes.empty?
    @planes
 end

 def airport_full?
   @planes.length >= @max_capacity
 end

end

#binding.pry