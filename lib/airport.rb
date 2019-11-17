require "./lib/planes"

class Airport

  attr_reader :planes, :capacity

  DEFALTCAPACITY = 20

  def initialize(capacity = DEFALTCAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "There is no space avaliable!" if full?

    raise "There is currently a storm no landings at this time" if stormy?

    # raise "This plane has already landed" if !plane.flying?

    @planes << plane
  end

  def take_off
    raise "There are currently no planes ready for take off" if empty?

    raise "There is currently a storm no take offs at this time" if stormy?

    @planes.pop
  end

  private

  def stormy?
    rand(100) <= 95
  end

  def empty?
    @planes.count < 1
  end

  def full?
    @planes.count >= capacity
  end

end
