require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @weather = Weather.new
  end

  def land_plane(plane)
    confirm_plane_is_flying(plane)
    check_landing_availability
    plane.land
    hanger << plane
  end

  def take_off_plane(plane)
    confirm_plane_is_landed_at_airport(plane)
    check_weather_for_flights
    plane.take_off
    hanger.slice!(hanger.index(plane))
  end

  private

  attr_reader :hanger, :weather

  def full?
    hanger.length >= @capacity
  end

  def stormy?
    weather.stormy?
  end

  def check_landing_availability
    fail "Hanger is full" if full?
    check_weather_for_flights
  end

  def check_weather_for_flights
    fail "Weather is stormy" if stormy?
  end

  def confirm_plane_is_flying(plane)
    fail "Plane is not flying" if flying?(plane) == false
  end

  def confirm_plane_is_landed_at_airport(plane)
    fail "Plane is flying" if flying?(plane)
    fail "Plane is not here" if located_here?(plane) == false
  end

  def flying?(plane)
    plane.flying == true
  end

  def located_here?(plane)
    [plane] == hanger.select{|plane_in_hanger| plane_in_hanger == plane}
  end

end
