require_relative 'plane'

class Airport
  attr_reader :gates, :capacity

  def initialize(no_of_planes = 0, capacity = 20)
    @gates = []
    @capacity = capacity
    no_of_planes.times { @gates << Plane.new } unless no_of_planes > capacity
  end

  def land_plane(plane)
    @gates.push
  end

  def take_off
    @flying = @gates.shift

  end
end
