# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes =[]
  end
  def land(plane)
    raise 'Cannot land plane: airport at full capacity' if full?
    raise 'Cannot land plane due to stormy weather' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot land plane due to stormy weather' if stormy?
  end
end

private
def full?
  @planes.length >= @capacity
end

def stormy?
  rand(1..6) > 4
end