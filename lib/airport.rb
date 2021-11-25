require 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity, :plane, :stormy

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    fail "Weather is too stormy for landing!" unless safe?
    fail "This airport is full!" if full?
    fail "This plane has already landed" if in_hangar?(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    fail "Weather is too stormy for take off!" unless safe?
    fail "This plane is not in our hangar" unless in_hangar?(plane)
    @hangar.pop(plane)
  end

  def full?
    capacity <= @hangar.size
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  def safe?
    rand(10) > 7
  end
end
