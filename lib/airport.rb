require_relative 'weather'

class Airport

  attr_reader :planes, :weather

  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    @planes << plane
    self
  end

  def plane_takeoff
    raise "There are no planes in the airport" if @planes.empty?
    raise "Plane cannot take-off from airport due to stormy weather" if weather.stormy == true
    @planes.pop
    self
  end

end