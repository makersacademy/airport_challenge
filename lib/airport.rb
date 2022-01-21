require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Permission denied, airport at capacity.' if @planes.count >= DEFAULT_CAPACITY
    @planes << plane
  end

  def take_off
    @planes.pop
    p "Confirmation, plane has left the airport."
  end
end
  