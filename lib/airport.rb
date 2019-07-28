require_relative 'plane'
class Airport
  attr_reader :planes
  attr_writer :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = "clear"
    @capacity = capacity
    @location = "grounded"
  end

  def land(plane)
    landing_checks(plane)
    touchdown(plane)
  end

  def take_off
    flight_checks
    charter_flight
  end

  def weather(report)
    @weather = report
  end

  private
  def full?
    @planes.count >= @capacity
  end

  def flight_checks
    if @weather == "stormy"
      raise "cannot take off while weather is stormy"
    elsif @planes[0].location == "in transit"
      raise "cannot take off while plane is in transit"
    end
  end

  def charter_flight
    plane = @planes[0]
    @planes.shift
    plane.location = "in transit"
    plane
  end

  def landing_checks(plane)
    if @weather == "stormy"
      raise "cannot land while weather is stormy"
    elsif full?
      raise "cannot land while airport is full"
    elsif plane.location != "in transit"
      raise "cannot land a plane which is already grounded"
    end
  end

  def touchdown(plane)
    plane.location = @location
    @planes << plane
  end

end
