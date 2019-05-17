class Airport
  attr_reader :capacity, :parking_station
  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @parking_station = []
  end

  def land(plane)
    raise "Unable to land, this airport is full" if full?
    @parking_station.push(plane)
  end

  def take_off
    raise "No planes available for take off" if empty?
    plane_to_fly = @parking_station.shift
  end

  def full?
    @parking_station.length >= @capacity
  end

  def empty?
    @parking_station.empty?
  end
end
