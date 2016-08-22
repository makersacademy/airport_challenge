require_relative "plane"
require_relative "air_traffic_control"

class Airport

  include AirTrafficControl

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = "sunny"
    @capacity = capacity
    @planes = []
  end

  def prevent_take_off
    fail 'Take-off not permitted due to stormy weather. Await for further instructions!' if stormy?
    fail 'Error! No plane to take-off!' if empty?
    plane = planes.pop
    plane.take_off
  end

  def prevent_landing(plane)
    fail 'Landing not permitted due to stormy weather. Await for further instructions!' if stormy?
    fail 'Landing not permitted - airport full. Await for further instructions!' if full?
    planes << plane
    plane.land
  end

private

attr_reader :planes
  def empty?
    @planes.empty?
  end

  def full?
    @planes.length >= @capacity
  end

end
