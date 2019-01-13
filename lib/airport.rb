class Airport
  attr_reader :plane, :capacity
  attr_writer :capacity

  def initialize
    @capacity = 1
  end

  def land(plane)
    raise 'Cannot Land: Turbulent Weather' if stormy?
    raise 'Cannot Land: Airport Full' if full?

    @plane = plane
  end

  def take_off(plane)
    raise 'Cannot Take Off: Turbulent Weather' if stormy?

    @plane = nil
  end

  private

  def stormy?
    Weather.current == "stormy"
  end

  def full?
    @plane
  end
end
