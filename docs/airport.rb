require './docs/plane.rb'
class Airport

  attr_reader :num_of_planes

  def initialize
    @planes = []
  end

  def land
    plane = Plane.new
    @planes.push(plane)
  end

  def take_off
    @planes.pop
  end

  def total_planes
    @planes.count
  end
end
