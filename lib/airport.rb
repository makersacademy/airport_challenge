require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane

  def initialize
    @plane = plane
    @terminal = []
  end

  def land(plane)
    if plane.land?
      @terminal << plane
      true
    end
  end

  def take_off(plane, weather)
    if weather.clear?
      if plane.take_off?
        @terminal.delete(plane)
      end
      true
    else
      "The skies are dark, best to stay on the ground"
    end
  end

end
