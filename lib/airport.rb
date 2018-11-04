require_relative 'plane'

class Airport

  attr_reader :planes, :weather

  def initialize(planes = [], weather = nil)
    @planes = planes
    @weather = weather
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

end
