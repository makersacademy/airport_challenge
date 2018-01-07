require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
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
