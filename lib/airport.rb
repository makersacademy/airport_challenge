require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_accessor :current_forecast

  def initialize
    @planes = []
    @current_forecast = Weather.new
  end

  def land_plane(plane)
    plane.report_landed
    planes << plane
  end

  def take_off
    if current_forecast.forecast == "Stormy"
      raise "All flights grounded"
    else
    plane = planes.pop
    plane.report_take_off
    plane
    end
  end



end
