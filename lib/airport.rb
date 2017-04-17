require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 100
  LAND_FULL_ERROR = "Can't land, the airport is full"
  LAND_STORMY_ERROR = "Can't land in storm"
  TAKE_OFF_STORMY_ERROR = "Can't take off in storm"

  attr_reader :landed_planes, :capacity, :weather

  def initialize(capacity=DEFAULT_CAPACITY, weather=Weather)
    @weather = weather
    @capacity = capacity
    @landed_planes = []
  end

  def clear_to_land?
    !weather.stormy?
  end

  def land(plane)
    fail LAND_FULL_ERROR if at_capacity?
    @landed_planes << plane
  end

  def take_off(plane)
    fail TAKE_OFF_STORMY_ERROR if weather.stormy?
    plane.take_off(self)
    remove_planes_from_landed_planes(plane)
  end

  def update_capacity(capacity)
    @capacity = capacity
  end

  private

  def at_capacity?
    landed_planes.count >= capacity
  end

  def remove_planes_from_landed_planes(plane)
    @landed_planes.delete(plane)
  end
end
