require './docs/plane.rb'
class Airport

  attr_reader :num_of_planes

  def initialize
    @planes = []
  end

  def land
    plane = Plane.new
  end

  def take_off
  end

  def total_planes
    @planes.count
  end
end
