
class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "You can't land, Airport is full" if full?
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    plane
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  # def hangar
  #  @plane
  # end
end
