require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 30

  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY

  end

  def land(plane)
    raise "Airport is full" if full?
    planes << plane

  end

  def take_off(plane)
    "#{plane} is no longer in the airport"
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

end
