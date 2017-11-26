require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :weather, :max_capacity
  def initialize weather, max_capacity = DEFAULT_CAPACITY
    @planes = []
    @weather = weather
    @max_capacity = max_capacity
  end

  def depart(plane)
    raise "Plane not found at this Airport" unless find_plane(plane)
    raise "Unsuitable conditions for takeoff" if weather.stormy?
    plane.takeoff
    remove_plane(plane)
  end

  def receive(plane)
    raise "Unsuitable conditions for landing" if weather.stormy?
    raise "Airport full, unable to receive plane" if planes.length >= max_capacity
    plane.land(self)
    add_plane(plane)
  end

  def find_plane(plane)
    planes.include? plane
  end

  private
  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.delete(plane)
    raise "Plane has not departed" if find_plane(plane)
  end
end
