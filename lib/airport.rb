require 'weather'

class Airport
  include Weather

  attr_accessor :hangar
  DEFAULT_HANGAR_SIZE = 20

  def initialize(capacity = DEFAULT_HANGAR_SIZE)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Stormy, cannot land" if stormy?
    raise "Airport is full" if full?
    raise "Plane has already landed" unless plane.flying

    plane.flying = false
    hangar.push(plane)
  end

  def takeoff
    raise "No Planes to take off" if hangar.empty?
    raise "Stormy, cannot takeoff" if stormy?

    plane = hangar.pop
    raise "Plane is already flying" if plane.flying

    plane.flying = true
    plane
  end

  private

  def full?
    hangar.length >= @capacity
  end

end
