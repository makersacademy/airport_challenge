require_relative "plane.rb"
require_relative "weather.rb"
require_relative "errors.rb"

class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane, weather)
    landing_checks(plane, weather)

    plane.land
    @planes << plane
  end

  def take_off(plane, weather)
    take_off_checks(plane, weather)

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

  def take_off_checks(plane, weather)
    raise RuntimeError, Errors.new(0).message if empty?
    raise RuntimeError, Errors.new(2).message unless contains_plane?(plane)
    raise RuntimeError, Errors.new(1).message if weather.stormy?
  end

  def landing_checks(plane, weather)
    raise RuntimeError, Errors.new(5).message unless plane.in_flight?
    raise RuntimeError, Errors.new(3).message if full?
    raise RuntimeError, Errors.new(4).message if weather.stormy?
  end
end
