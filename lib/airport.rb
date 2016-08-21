require_relative 'plane'
require_relative 'weather'

class Airport

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
    fail "Full airport" if full?
    if plane.landed?
        raise "already landed"
    else
      plane.report_landed
      planes << plane
    end
  end

  def take_off
    fail "All flights grounded" if current_forecast.forecast == "Stormy"
    fail "Plane is not in airport" if empty?
    plane = planes.pop
    plane.report_take_off
    plane
  end

private

  attr_reader :planes

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end


end
