require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity
  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
  end

  def clear_for_takeoff
    my_plane = planes.pop
    my_plane.take_off
    my_plane
  end

  def clear_for_landing(plane)
    fail 'Too stormy' if get_weather_report == :stormy
    fail 'Airport full' if full?
    plane.land
    planes << plane
  end

  def get_weather_report
    @current_weather = Weather.new.weather_report
  end
  private
  attr_reader :planes

  def full?
    planes.size >= capacity
  end

end
