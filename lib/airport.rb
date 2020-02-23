require_relative 'plane'


class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)

    fail 'Airport is full' if full?

    @planes << plane
    plane
  end

  def takeoff


    @planes.pop

    'Airplane has took off'
  end

  def storm?
    storm = rand(1..10)
    if storm == 4
      return true
    end
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

end
