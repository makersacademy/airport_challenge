require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    "#{plane} is no longer at the airport"
  end
end
