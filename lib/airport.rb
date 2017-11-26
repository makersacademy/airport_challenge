require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :planes
  attr_accessor :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane, weather = @weather)
    if weather.stormy
      puts "Plane can't land yet due to stormy weather."
    else
      @planes << plane
    end
    change_weather
  end

  def take_off(plane, weather = @weather)
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
end
