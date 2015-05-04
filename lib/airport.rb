require 'plane'

class Airport

  def initialize
    @planes = []
  end

  def allow_takeoff (aeroplane)
  end

  def allow_landing (aeroplane)
    fail 'Airport is full!' if @planes.count >= 6
    @planes << aeroplane
    aeroplane.lands
  end

end
