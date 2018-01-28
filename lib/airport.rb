require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Please enter holding pattern, we are at full capacity" if full?
    raise "That plane is not flying" if !plane.flying?
    # raise "It is too stormy to land" if stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "That plane is not at this airport" if !at_airport?(plane)
    # raise "It is too stormy to take off" if stormy?
    plane.fly
    @planes.delete plane
  end

  private

  def stormy?
    rand(3) >= 1 ? false : true
  end

  def full?
    @planes.count >= @capacity
  end

  def at_airport?(plane)
    @planes.include? plane
  end
end
