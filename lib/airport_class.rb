require "plane_class.rb"
class Airport 
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes.push(plane)
    puts @planes
  end
end

plane = Plane.new

