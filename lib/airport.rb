require_relative 'plane'
DEFAULT_CAPACITY = 10

class Airport

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def put_in_airport(plane)
    fail "Stormy weather - plane can't land!" if stormy?
    fail "Airport is full - plane can't land!" if airport_full?
    @planes << plane
  end

  def take_from_airport(plane)
    fail "Stormy weather - plane can't take off!" if stormy?
    @planes.delete(plane)
  end

  private

  def random
    rand(1..100)
  end

  def stormy?
    random < 5
  end

  def airport_full?
    @planes.size >= @capacity
  end

end
