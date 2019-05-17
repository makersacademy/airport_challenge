class Airport
  attr_reader :capacity, :parking_station

  def initialize(capacity=5)
    @capacity = capacity
    @parking_station = []
  end

  def land(plane)
    @parking_station.push(plane)
  end
end
