require_relative 'airplane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def capacity_change(number)
    @capacity = number
  end

  def plane_land(plane)
    fail "Plane is already landed" if landed?
    fail "Cannot land as airport is full" if full?
    fail "Cannot land due to inclement weather" if weather?
    plane.land
    @planes << plane
  end

  def plane_takeoff(plane)
      fail "Plane is not at airport" unless plane_at_airport?(plane)
      fail "Flight status is unknown" if unknown_status?(plane)
      fail "Flight is not landed" if inflight?(plane)
      fail "Cannot take off due to inclement weather" if weather?
      plane.takeoff
      @planes.delete(plane)
  end

  private

  def weather?
    weather = Weather.new
    weather.inclement?
  end

  def full?
    @planes.size == capacity
  end

  def plane_at_airport?(plane)
    @planes.include? plane
  end

  def unknown_status?(plane)
    plane.current_status.nil?
  end

  def inflight?(plane)
    plane.current_status == :inflight
  end

  def landed?(plane)
    plane.current_status == :landed
  end
end
