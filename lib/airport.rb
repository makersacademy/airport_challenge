require_relative 'plane'

class Airport
  attr_reader :planes, :capacity, :weather
    DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes   = []
    @capacity = capacity
    @weather  = 'sunny'
  end

  def land(plane)
    landing_fail_checks(plane)
    plane.land
    @planes << plane
  end

  def take_off(plane)
    take_off_fail_checks(plane)
    plane.take_off
    @planes.delete(plane)
  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.length <= 0
  end

  def sunny?
    @weather == 'sunny'
  end

  def stormy?
    @weather == 'stormy'
  end

  private
  def take_off_fail_checks(plane)
    fail 'Plane Already Flying' if plane.flying?
    fail 'Plane Not At This Airport' unless @planes.include?(plane)
  end

  def landing_fail_checks(plane)
    fail 'Plane Already Grounded' if plane.grounded?
    fail 'Airport Full' if full?
  end
end
