require_relative 'plane'
DEFAULT_CAPACITY = 10

class Airport

  attr_reader :hanger

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail "Stormy weather - plane can't land!" if stormy?
    fail "Hanger is full - plane can't land!" if hanger_full?
    @hanger << plane
  end

  def take_off(plane)
    fail "Stormy weather - plane can't take off!" if stormy?
    @hanger.delete(plane)
  end

  def random
    rand(1..100)
  end

  def stormy?
    random < 5
  end

  def hanger_full?
    @hanger.size >= @capacity
  end

end
