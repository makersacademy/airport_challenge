require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land
    @planes << Plane.new
    @planes.last
  end

  def take_off
    @planes.pop
  end

  def view_planes
    @planes
  end

end
