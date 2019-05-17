class Airport
  attr_reader :capacity, :parking_station
  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @parking_station = []
  end

  def land(plane)
    @parking_station.push(plane)
  end
end
