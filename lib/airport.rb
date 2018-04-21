require_relative './plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    fail 'cannot take off due to stormy conditions' if rand(10) == 9
    @planes.pop
    @planes
  end

end
