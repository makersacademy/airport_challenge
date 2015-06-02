require 'plane'

class Airport

  CAPACITY = 6

  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def allow_takeoff(_aeroplane)
  end

  def allow_landing(aeroplane)
    fail 'Airport is full!' if @planes.count >= CAPACITY
    @planes << aeroplane
    aeroplane.lands
  end

end
