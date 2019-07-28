class Airport
  def initialize
    @airport = []
  end

  def full?
    # Declares capacity of airport
    @airport.count >= 10
  end
  
  def empty?
    # Checks if airport is empty
    @airport.count.zero?
  end

  def land(plane)
    # New plane object
    Plane.new = plane 
    # If the airport is full, raise an error
    fail 'Airport is full' if full?

    # If the airport isn't full add plane
    @airport << plane
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
