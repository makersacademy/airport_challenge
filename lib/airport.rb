require_relative 'plane'
class Airport
  attr_accessor :planes
  attr_writer :capacity
  attr_reader :weather
  DEFAULT_CAPACITY = 10
  OUTLOOKS = [:stormy, :fine, :fine, :fine, :fine]

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = wait_a_few_minutes
    @capacity = capacity
  end

  def wait_a_few_minutes
    @weather = OUTLOOKS.sample
  end

  def land(plane)
    landing_checks(plane)
    touchdown(plane)
    wait_a_few_minutes
    plane
  end

  def take_off(plane)
    flight_checks(plane)
    charter_flight(plane)
    wait_a_few_minutes
    plane
  end

  private
  def full?
    @planes.count >= @capacity
  end

  def charter_flight(plane)
    @planes.delete(plane)
    plane.change_location
    plane
  end

  def landing_checks(plane)
    weather_check("landing")
    hanger_check
    plane.landing_check
  end

  def flight_checks(plane)
    weather_check("flights")
    plane_id_check(plane)
    plane.flight_check
  end

  def weather_check(operation)
    raise "no #{operation} while weather is stormy" if stormy?
  end

  def hanger_check
    raise "cannot land while airport is full" if full?
  end

  def plane_id_check(plane)
    raise "that plane is not in this airport" if unavailable?(plane)
  end

  def stormy?
    weather == :stormy
  end

  def unavailable?(plane)
    !@planes.include?(plane)
  end

  def touchdown(plane)
    plane.change_location(self)
    @planes << plane
  end

end
