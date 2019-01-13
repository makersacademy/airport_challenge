class AirportOccupancy # Responsible for reporting the occupancy condition of an airport
  attr_accessor :capacity, :available

  def initialize(capacity = 0, available = 0)
    @capacity = capacity
    @available = available
  end

  def check_full
    @available >= @capacity ? true : false
  end

  def check_empty
    @available == 0 ? true : false
  end
end
