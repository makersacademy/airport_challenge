class Airport
  # create attribute for airport capacity
  attr_reader :capacity

  def initialize
    # set default capacity
    @capacity = 1
    # creates an empty array to store planes landing at this airport
    @airport = []
  end

  def change_capacity(capacity)
    # update airport capacity
    @capacity = capacity
  end

  def hanger_in(plane)
    # store a landed plain in the airport hanger
    @airport << plane
  end

  def hanger_count
    # count how many planes are in the hanger
    @airport.count
  end

  def hanger_out(plane)
    # remover the plane that has taken off from the hanger
    @airport.delete(plane)
  end

  def has_capacity
    return true if hanger_count < @capacity
    false
  end

end
