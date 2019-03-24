require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  attr_reader :plane

  def landing_plane
  end

  def airport_capacity(plane)
    fail 'Airport is full' if empty?
    @planes.pop
  end

  def land(plane)
    fail 'Stormy weather, do not land!' unless @plane
    fail 'Airport is full' if full?
    @plane = plane
    @planes << plane
  end

  def take_off(plane)
    fail 'Stormy weather, do not take off!' unless @plane
    @plane
  end

private

def full?
  bikes.count >= 20
end

def empty?
  @planes.empty?
end

end
