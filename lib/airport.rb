require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize
    @plane = plane
    @terminal = []
  end

  def land(plane)
    if plane.land?
      @terminal << plane
    end
  end

  def take_off(plane)
    if plane.take_off?
      @terminal.delete(plane)
    end
  end

end
