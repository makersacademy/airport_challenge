require_relative './plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'cannot land due to stormy conditions' if stormy?
    @planes << plane
  end

  def take_off
    fail 'cannot take off due to stormy conditions' if stormy?
    @planes.pop
    @planes
  end

private

  def stormy?
    rand(10) == 9
  end

end
