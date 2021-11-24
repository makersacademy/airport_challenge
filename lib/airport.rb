<<<<<<< HEAD
=======
#require_relative 'plane'
 
class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity, :plane

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    fail "This airport is full!" if full?
    fail "This plane has already landed" if in_hangar?(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    fail "This plane is not in our hangar" unless in_hangar?(plane)
    @hangar.pop(plane)
  end

  def full?
    capacity <= @hangar.size
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end
end
>>>>>>> new_edge_cases
