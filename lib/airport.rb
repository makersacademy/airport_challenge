require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    raise "Airport capacity must be a positive integer" if not_positive_integer?(capacity)

    @capacity = capacity
    @hangar = Array.new
  end

  def land(plane)
    raise "Landing not permitted: airport full!" if full?
    
    hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
  end

  def contains?(plane)
    hangar.include?(plane)
  end

  private

  def not_positive_integer?(capacity)
    !capacity.is_a?(Integer) || capacity < 1
  end

  def full?
    hangar.size == @capacity
  end

end
