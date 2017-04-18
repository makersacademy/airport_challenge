require_relative "weather_report"

class Airport

  DEFAULT_CAPACITY = 3
  attr_reader :capacity, :parking_area, :weather_report


  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @parking_area = []
  end

  def land(plane)
    fail "Airport is full" if full?
    fail "Cannot land plane: weather is storm" if stormy?
    plane.land(self)
    @parking_area << plane
  end

  def depart(plane)
    fail "Cannot take off plane: weather is stormy" if stormy?
    fail "No planes at airport" if empty?
    plane.depart
    @parking_area.pop
  end


  private

  def empty?
    @parking_area.empty?
  end

  def full?
    @parking_area.count >= capacity
  end

  def stormy?
    rand(1..6) > 3
  end

end
