require './lib/airplane.rb'

class Airport
  attr_reader :planes

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    @planes << plane
  end

  def take_off
    @planes.pop
    'airplane has taken off and is no longer in the airport'
  end
end
