require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 40

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Full to capacity: Landing Denied. Proceed to default airport" if full?

    @planes << plane
  end
        
  def take_off(airport)
  end

    

    private

  def full?
    @planes.length >= @capacity

  end

end
