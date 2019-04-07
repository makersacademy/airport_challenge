require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Plane has already landed!" if @planes.include?(plane)
    @planes << plane
  end

  def take_off
    @planes.shift
  end

end
