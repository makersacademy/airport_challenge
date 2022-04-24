class Airport
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = Array.new
    @weather = Weather.new
  end

  def land(plane)
    check_weather_condition
    check_airport_capacity
    land_plane(plane)
  end

  def take_off(plane)
    check_plane_at_airport(plane)
    check_weather_condition
    take_off_plane(plane)
  end

  def include?(plane)
    hangar.include?(plane)
  end

  private

  attr_reader :hangar, :capacity, :weather

  def take_off_plane(plane)
    plane.take_off
    hangar.delete(plane)
  end

  def check_plane_at_airport(plane)
    fail 'Plane not at airport' unless include?(plane)
  end

  def land_plane(plane)
    plane.land
    hangar << plane
  end

  def check_airport_capacity
    fail 'Airport full' if full?
  end

  def check_weather_condition
    fail 'Weather is stormy' if stormy?
  end

  def stormy?
    @weather.stormy?
  end

  def full?
    hangar.length == capacity
  end
end
