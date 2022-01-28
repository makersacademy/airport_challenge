require_relative 'plane'
class Airport

  def initialize 
    @planes = []
  end

  def land(plane)
    @planes.size >= 1 ? (raise "Airport is full. Can't land") : @planes << plane
  end

  def take_off(plane)
    "flight #{plane} has taken off from runway 1"
  end
end
