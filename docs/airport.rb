class Airport
  attr_reader :capacity, :parking_station
  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @parking_station = []
  end

  def land(plane)
    raise "Unable to land, this airport is full" if @parking_station.length >= @capacity
    @parking_station.push(plane)
  end

  def take_off
    if @parking_station.empty?
      raise "No planes available for take off"
    else
      plane_to_fly = @parking_station.shift
    end
  end
end
