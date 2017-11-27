require_relative "plane"
require_relative "weather"
class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity
  attr_writer :weather
  
  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land plane
    raise "Airport Full, Cannot Land" if full?
    raise "It's not safe to land at the moment!" unless safe_to_fly?
    @expecting = plane
    plane.land self
    @planes << plane
    @expecting = nil
  end

  def release_for_takeoff plane
    raise "Plane Not Here" unless plane_in_airport? plane
    raise "It's not safe to take off at the moment!" unless safe_to_fly?
    @released_for_takeoff = plane
    plane.take_off
    @released_for_takeoff = nil
    @planes.delete plane
  end

  def expecting? plane
    @expecting == plane
  end

  def released_for_takeoff? plane
    @released_for_takeoff == plane
  end

  private

  def safe_to_fly?
    @weather.conditions != :Stormy
  end

  def full?
    planes.count == capacity
  end

  def plane_in_airport? plane
    @planes.include? plane
  end
end
