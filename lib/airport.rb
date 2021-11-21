require_relative 'plane'
require_relative 'weather'
 
class Airport
  CAPACITY = 42
  attr_reader :capacity, :hangar, :weather

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = rand(10)
  end

  def land(plane)
    fail 'Weather is stormy please do not land' unless safe?
    fail 'Airport is full' if full?
    @hangar << plane
    plane.landed
  end

  def full?
    @hangar.size >= @capacity
  end

  def take_off(plane)
    fail 'Weather is stormy! please do try to land' unless safe?
    fail 'this plane is not in this Airport' unless in_hangar?(plane)
    @hangar.pop
    plane.taken_off
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  def safe?
    @weather > 7
  end
end
