require_relative 'plane'
 
class Airport
  CAPACITY = 42
  attr_reader :capacity, :hangar

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    @hangar << plane
    plane.landed
  end

  def full?
    @hangar.size >= @capacity
  end

  def take_off(plane)
    fail 'this plane is not in this Airport' unless in_hangar?(plane)
    fail 'Weather is too stormy to take off' if safe?
    @hangar.pop
    plane.taken_off
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  def safe?
    rand(10) > 7
  end
end
