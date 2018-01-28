require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "That plane is already at this airport" if at_airport?(plane)
    raise "That plane has landed but not at this airport" unless plane.flying?
    raise "It is too stormy to land" if stormy?
    raise "Please enter holding pattern, we are at full capacity" if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "That plane is not at this airport" unless at_airport?(plane)
    raise "It is too stormy to take off" if stormy?
    plane.fly
    @planes.delete plane
  end

  private

  def stormy?
    rand(3) < 1
  end

  def full?
    @planes.count >= @capacity
  end

  def at_airport?(plane)
    @planes.include? plane
  end
end
