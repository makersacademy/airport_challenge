require_relative "plane.rb"
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane, weather)
    full_message = "Plane cannot land as the Airport is full"
    stormy_message = "Plane cannot land as the conditions are stormy"
    raise RuntimeError, full_message if full?
    raise RuntimeError, stormy_message if weather.stormy?

    @planes << plane
  end

  def take_off(plane, weather)
    no_planes_message = "No planes at the airport"
    stormy_message = "Plane cannot take off due stormy weather"
    invalid_plane_message = "Cannot take off, Plane not at specified airport"
    raise RuntimeError, no_planes_message if empty?
    raise RuntimeError, invalid_plane_message unless contains_plane?(plane)
    raise RuntimeError, stormy_message if weather.stormy?
    
    @planes.delete(plane)
    "Plane has taken-off"
  end

  def contains_plane?(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.count < 1
  end
end
