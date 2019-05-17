class Airport
  attr_reader :capacity, :parking_station
  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @parking_station = []
  end

  def land(plane)
    if @parking_station.length >= @capacity
      raise "Unable to land, this airport is full"
    else
      @parking_station.push(plane)
    end
  end

  def take_off
    plane_to_fly = @parking_station.shift
  end
end
