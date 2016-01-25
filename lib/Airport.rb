require_relative 'aircraft'
require_relative 'weather'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def take_off(plane)
    plane.report_take_off
    @planes.delete(plane)
    plane
  end

  def land(plane)
    plane.report_landed
    @planes << plane
  end

  def weather
    @weather.sunny?
  end

end
