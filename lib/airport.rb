require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @stormy = Weather.new.stormy?
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
    bad_weather_landing?
    full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    bad_weather_taking_off?
    plane.take_off
    remove_from_airport(plane)
  end

  def check_new_weather
  @stormy = Weather.new.stormy?
  report_weather
  end

  private

  def remove_from_airport(plane)
    @planes.delete(plane)
  end

  def bad_weather_landing?
    fail "The plane cannot land during the storm." if @stormy
  end

  def bad_weather_taking_off?
    fail "The plane cannot take off during the storm." if @stormy
  end

  def full?
    fail "The airport is full." if @planes.length >= @capacity
  end

end
