require_relative 'airport_runway'

class AirportHanger
  DEFAULT_CAPACITY = 5

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Cannot Land' if full?
    @planes << plane
  end

  def takeoff
    fail 'no planes' if empty?
    @planes.pop
  end


  private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
