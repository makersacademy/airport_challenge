require "./lib/airport.rb"

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
     airport.planes << self
   end
  
end