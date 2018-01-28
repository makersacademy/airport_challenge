
class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airplane is not allow to land, Airport is full" if full?
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    "Plane has taken off"
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  # def hangar
  #  @plane
  # end
end
