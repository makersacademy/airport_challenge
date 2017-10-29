require './lib/plane'

class Airport

  attr_reader :planes, :capacity
  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    fail "Bad weather for landing" if stormy?
    fail "Plane already landed" if landed?(plane)
    @planes << plane
    puts "Plane has landed"
  end

  def take_off(plane)
    raise "Airport is empty" if empty?
    raise "Bad weather for take off" if stormy?
    fail "Plane not present" unless landed?(plane)
    @planes.delete(plane)
    puts "Plane has taken off"
  end

  def stormy?
    rand(101) > 80
  end

private
  def full?
    @planes.length == capacity
  end

  def empty?
    @planes.empty?
  end

  def landed?(plane)
    @planes.include?(plane)
  end

end
