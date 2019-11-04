require './lib/plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if @planes.size >= 1
    @planes << plane
  end

  def take_off(plane)
    @planes[1..-1]
  end
end
