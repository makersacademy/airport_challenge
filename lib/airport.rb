require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_accessor :current_forecast
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @current_forecast = Weather.new
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Delay landing!" if current_forecast.forecast == "Stormy"
    fail "Full airport" if planes.length >= capacity
    fail "already landed" if planes.include? plane
    plane.report_landed
    planes << plane
  end

  def take_off
    fail "All flights grounded" if current_forecast.forecast == "Stormy"
    plane = planes.pop
    plane.report_take_off
    plane
  end



end
