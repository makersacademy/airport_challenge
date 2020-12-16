require "plane_class.rb"
class Airport 
  attr_accessor :planes
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes.push(plane)
    puts @planes
  end
end
