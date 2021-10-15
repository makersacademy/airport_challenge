class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def instruct_to_land(plane)
    raise "AirportFull" if full?
    @landed_planes << plane 
  end

  def instruct_to_take_off(plane)
  end

  def plane_at_airport?(_plane)
    false
  end

  private

  def full?
    @landed_planes.count >= @capacity
  end

end
