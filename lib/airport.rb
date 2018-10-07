require_relative 'plane.rb'

class Airport

  attr_reader :plane
  def initialize()
    @airport = []
  end

  def take_off
    Plane.new
  end

  def land_plane(plane)
    @plane = plane
    @airport << @plane
  end

end
