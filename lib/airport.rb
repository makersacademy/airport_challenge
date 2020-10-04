require_relative 'weather'
require_relative 'plane'

class Airport

  def initialize
    @parked = []
  end

  def land(plane)
    @parked.push(plane)
  end

end

