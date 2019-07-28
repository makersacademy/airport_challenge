class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :airport
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def full?
    # Declares capacity of airport
    airport.count >= capacity
  end

  def empty?
    # Checks if airport is empty
    airport.count.zero?
  end

  def land(plane)
    # If the airport is full, raise an error
    fail 'Airport is full' if full?

    # If the airport isn't full add plane
    airport << plane
  end

  def take_off
    # If the airport is empty, raise an error
    raise 'Airport is empty' if empty?

    # Confirms plane is no longer in airport
    puts "Plane #{@airport.last} has taken off"
    # If airport is not allow plane to take off
    @airport.pop
  end
end
