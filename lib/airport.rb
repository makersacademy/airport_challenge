class LandingError < StandardError; end
class TakeoffError < StandardError; end

class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    check_landing_status(plane)
    @planes << plane
    plane.landed(self)
  end

  def request_take_off(plane)
    check_take_off_status(plane)
    @planes.delete(plane)
    plane.take_off_from_airport
  end

  def plane_count
    @planes.count
  end

  private

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def check_landing_status(plane)
    raise(LandingError, "This plane has already landed") if plane.flying? == false
    raise(LandingError, "plane cannot land because the airport is full") if full?
    raise(LandingError, "plane cannot land in stormy weather") if stormy?
  end

  def check_take_off_status(plane)
    raise(TakeoffError, "plane cannot take off in stormy weather") if stormy?
    raise(TakeoffError, "flying plane cannot take off and cannot be in an airport") if plane.flying?
    raise(TakeoffError,"plane is not at this airport") unless at_airport?(plane)
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..100) > 70
  end

end
