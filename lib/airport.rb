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
      plane.report_landed(self)
      planes << plane
    end
  end


  def launch_plane(plane)
    fail "No flights" if current_forecast.forecast == "Stormy"
    fail "Plane not here" if find_plane(plane) == false
      plane.report_take_off
      planes.delete(plane)
      plane
  end

  def find_plane(plane)
    found = false
    planes.each do |current_plane|
      if current_plane == plane
        found = true
        break
      end
    end
    found
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
