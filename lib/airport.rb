require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 9001

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing_plane(plane)
    fail "Unable to land" if (full_airport || weather)
    fail "This plane has already landed!" if @planes.include? plane
    plane.update_status
    @planes << plane
  end

  def take_off(plane)
    fail "Unable to take off" if (no_planes || weather)
    fail "This plane is not at the airport!" unless @planes.include? plane
    plane.update_status
    @planes.pop
  end

  def no_planes
    @planes.length.zero?
  end

  def full_airport
    @planes.length >= @capacity
  end

  def weather
    @weather ||= Weather.new.stormy
  end

end
