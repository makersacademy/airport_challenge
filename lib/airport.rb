require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 5

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @stormy = weather.stormy?
    @planes = []
    @capacity = capacity
  end

  def report_weather
    return "It is stormy." if @stormy
    return "It is sunny."
  end

  def status(plane)
    return "Landed" if plane.landed == true
    return "In the air" if plane.landed == false
  end

  def land(plane)
    fail "The plane cannot land during the storm." if bad_weather_landing?
    fail "The airport is full." if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane is not at this airport." if plane_not_in_airport?(plane)
    fail "The plane cannot take off during the storm." if bad_weather_taking_off?
    plane.take_off
    remove_from_airport(plane)
  end

  def check_new_weather
    self.weather.set_weather
    @stormy = weather.stormy?
    report_weather
  end

  private

  def remove_from_airport(plane)
    @planes.delete(plane)
  end

  def plane_not_in_airport?(plane)
    (@planes.include? plane) == false
  end

  def bad_weather_landing?
    @stormy
  end

  def bad_weather_taking_off?
    @stormy
  end

  def full?
    @planes.length >= @capacity
  end

end
