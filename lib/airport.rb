require_relative 'plane'

class Airport  
  def initialize
    @plane_inventory = []
    @capacity = 10
  end
  def land(plane)
    fail "Airport at capacity" if @plane_inventory.length >= @capacity
    @plane_inventory << plane
      "#{plane} landed"
  end

  def take_off(plane)
    fail 'No planes on the ground' if @plane_inventory.empty?
    @plane_inventory << plane
    "#{plane} plane(s) taken off and no longer in the airport"
  end
  def plane_inventory
    @plane_inventory.count
  end
  attr_reader :capacity
end



# need another test to see if land_plane and take off correctly edit the plane inv log
# if @plane_inventory += planes <= @capacity
#   else "UNSAFE TO LAND - Airport at capcity"
# if (@plane_inventory += planes) > 10
# @plane_inventory = @capacity
# puts "UNSAFE TO LAND - Airport at capcity"
# end 

# plane = Plane.new