require_relative 'plane'

class Airport
  attr_reader :hangar, :capacity, :flying

  def initialize(no_of_planes = 0, capacity = 20)
    @hangar = []
    @capacity = capacity
    no_of_planes.times { @hangar << Plane.new } unless no_of_planes > capacity
  end

  # this method lands
  def land_plane(plane)
    p 'The plane has landed'
    @hangar.push(plane)
  end

  def take_off
    p 'The plane has taken off'
    @flying = @hangar.shift
  end
end
