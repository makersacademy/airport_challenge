require 'pry'
require_relative './plane.rb'

class Airport

attr_reader :planes

def initialize
  @planes = []
end

 def instruct_land(plane)
   @planes.include?(plane) ? raise("Error: this plane has already landed") : planes << plane
 end

 def instruct_take_off
    planes.empty? ? raise("Error: no planes in airport") : authorize
 end

 private

 def authorize
    @planes.pop
    @planes
 end


end

binding.pry