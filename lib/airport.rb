require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def take_off
    Plane.new
  end

  def land plane
    fail "Airport is full" if full?
    planes << plane
  end


  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

end
