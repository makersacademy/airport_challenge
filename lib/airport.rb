require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land

  end

  def take_off
    "Plane has taken off"
  end
end
