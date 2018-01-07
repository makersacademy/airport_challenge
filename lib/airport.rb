require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACTITY = 10

  def initialize(capacity = DEFAULT_CAPACTITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise 'This plane is not flying' if parked? plane
    raise 'Could not complete landing due to weather' if weather.stormy?
    raise 'Cannot land because airport is full' if full?
    plane.lands
    @planes << plane
  end

  def take_off(plane)
    raise 'This plane is already flying' if flying? plane
    raise 'Airport is empty!' if @planes.empty?
    raise 'Plane not in airport' unless found? plane
    raise 'Could not complete takeoff due to weather' if weather.stormy?
    plane.takes_off
    @planes.delete(plane)
  end

  private

  def full?
    @planes.size == @capacity
  end

  def found?(plane)
    @planes.include? plane
  end

  def parked?(plane)
    plane.status == :parked
  end

  def flying?(plane)
    plane.status == :flying
  end
end
