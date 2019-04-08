
class Airport
  CAPACITY = 50

  def initialize(options = {})
    @landing_planes = true
    @departing_planes = true
    @capacity = options.fetch(:capacity, CAPACITY)
    @planes = []
  end

  def stormy?
    @stormy
  end

  def plane_landing?
    @landing_planes
  end

  def take_off_planes?
   @departing_planes
  end

  def land planes
    @planes << planes
  end

  def full?
    @full == @capacity
  end

  def full_airport
    50.times { airport.full(Airport.new)}
  end
end
