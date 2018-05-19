require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane is not at airport' unless @planes.include?(plane)
    fail 'Cannot take off, weather is stormy' if stormy?
    @planes.delete(plane)
  end
end
