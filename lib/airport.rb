require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Unable to land" if full? == true || bad_weather? == true
    fail "This plane has already landed!" if @planes.include? plane
    plane.update_status
    @planes << plane
  end

  def takeoff_plane(plane)
    fail "Unable to take off" if empty? == true || bad_weather? == true
    fail 'This plane is not at the airport!' unless @planes.include? plane
    plane.update_status
    @planes.pop
  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.length.zero?
  end

  def bad_weather?
    Weather.stormy?
  end

end
