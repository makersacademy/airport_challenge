require "./lib/airport.rb"
require "./lib/control_tower.rb"

class Plane
  
  attr_accessor :flying
  attr_reader :name, :plane_id
  
  @@total_planes = 0
  
  def initialize
    @plane_id = "737-" + "#{@@total_planes + 1}"
    @flying = false
    @@total_planes += 1
  end
  

   def dock(airport)
     return "#{airport.name} is full" if airport.full?
     return "#{self.plane_id} is flying" if self.flying == true
     airport.planes << self
   end
  
end