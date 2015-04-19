require_relative 'weather_report'

class Airport
  attr_reader :capacity, :planes

  def initialize options = {}
    @capacity = options.fetch([:capacity], default_capacity)
    @planes = []
  end

  def stormy?
    weather_report.stormy?
  end

  def land_plane plane
    fail 'Airport full' if full?
    fail 'Plane cannot land in storm' if stormy?
    planes << plane
    plane.land
  end

  def launch_plane plane
    fail 'Plane cannot take off in storm' if stormy?
    plane.take_off
    planes.delete(plane)
  end

  def plane_count
    planes.count
  end

  def full?
    plane_count >= capacity
  end

  private

  def default_capacity
    60
  end

  def weather_report
    WeatherReport.new
  end
end
