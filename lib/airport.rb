require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Aiport is closed for landing due to the storm' if storm?
    fail 'Airport is full' if full?

    @planes << plane
    plane
  end

  def takeoff
    fail 'Airport closed for take off due to the storm' if storm?

    @planes.pop

    'Airplane has took off'
  end

  def storm?
    storm = rand(1..10)
    true if storm == 4

  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

end
