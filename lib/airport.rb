class Airport

  DEFAULT_GROUND_FLEET_CAPACITY = 20

  attr_reader :ground_fleet, :capacity

  def initialize(capacity=DEFAULT_GROUND_FLEET_CAPACITY)
    @ground_fleet = []
    @capacity = capacity
  end

  def arrive(plane)
    return @ground_fleet << plane unless full?
    raise 'The ground fleet is at capacity'
  end

  def depart
    return @ground_fleet.pop unless empty?
    raise 'No planes available in ground fleet'
  end

  def full?
    @ground_fleet.count == @capacity
  end

  def empty?
    @ground_fleet.empty?
  end

end
