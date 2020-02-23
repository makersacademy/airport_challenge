require_relative 'plane'
class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if @planes.count == 1

    @planes << plane
    plane
  end

  def takeoff
    @planes.pop

    'Airplane has took off'
  end
end
