require 'pry'
require_relative './plane.rb'

class Airport

attr_reader :planes
attr_reader :max_capacity
attr_reader :weather

def initialize(max_capacity = 20)
  @max_capacity = max_capacity
  @planes = []
  @weather = ["stormy", "sunny", "sunny", "sunny", "sunny", "sunny"]
end

 def instruct_land(plane)
   if stormy?
     raise("Permission to land denied due to stormy weather")
   elsif airport_full?
     raise("Error: Airport is full. find somewhere else to land")
   else
     @planes.include?(plane) ? raise("Error: this plane has already landed") : planes << plane
   end
 end

 def instruct_take_off
    if stormy?
      raise("Permission to take off denied due to stormy weather")
    else 
      planes.empty? ? raise("Error: no planes in airport") : authorize
    end
 end

 private

 def authorize
    puts "#{planes.pop} has successfully taken off" if !planes.empty?
    @planes
 end

 def airport_full?
   @planes.length >= @max_capacity
 end

 def stormy?
   weather.sample == "stormy"
 end

end

# binding.pry
