require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    plane.lands
    @planes << plane
  end

  def take_off
    raise 'Airport is empty!' if @planes.empty?
    @planes[-1].takes_off
    @planes.pop
  end
end
