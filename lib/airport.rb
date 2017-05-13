require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    raise 'No planes currently available' if planes.empty?
    @planes.pop
  end

end
