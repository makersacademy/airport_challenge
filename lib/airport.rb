require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Airport is full" if full
    @hangar << plane
  end

  def take_off(plane)
    "The plane: #{plane} has taken off"
  end

  private

  def full
    @hangar.length >= @capacity
  end

end
