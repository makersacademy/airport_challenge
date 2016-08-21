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

  # def take_off
  #   # fail "All flights grounded" if current_forecast.forecast == "Stormy"
  #   # fail "Plane is not in airport" if empty?
  #   # plane = planes.pop
  #   # launch_plane(plane)
  #   # plane.report_take_off
  #   # plane
  #   launch_plane(planes[-1])
  # end

  def launch_plane(plane)
    fail "All flights grounded" if current_forecast.forecast == "Stormy"
    fail "Plane is not in airport" if empty?
    if find_plane(plane)
      plane.report_take_off
      planes.delete(plane)
      plane
    else
      raise "Plane is not at airport"
    end
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
