require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  attr_accessor :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane, weather = @weather)
    fail "Airport full" if full?
    if weather.stormy
      puts "Plane can't land yet due to stormy weather."
    else
      @planes << plane
    end
    change_weather
  end

  def take_off(plane, weather = @weather)
    fail "Airport empty" if empty?
    if weather.stormy
      puts "Plane has been temporarily grounded due to stormy weather."
    else
      @planes.delete(plane)
    end
    change_weather
  end

  private

  def change_weather
    rand(6) == 0 ? @weather.stormy = true : @weather.stormy = false
  end

  def full?
    @planes.size >= @capacity
  end

  def empty?
    @planes.size == 0
  end

end
