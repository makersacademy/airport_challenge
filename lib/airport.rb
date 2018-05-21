require "plane"
class Airport
  attr_reader :planes, :capacity
  attr_writer :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise ' Weather is stormy - cannot land! ' if stormy?
    raise ' Airport is full - cannot land ' if full?
    # raise ' The plane has already landed ' if at_airport?(plane)
    @planes << plane
  end

  def take_off(plane)
    raise ' Weather is stormy - cannot take_off! ' if stormy?
    raise ' The plane is not at the current airport ' if !at_airport?(plane)
    @planes.pop
  end

  private
  def stormy?
    rand(6) > 4
  end

  def full?
    @planes.length >= @capacity
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

end
