require_relative "plane"
require_relative "weather"

class Airport
  attr_accessor :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 9001

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing_plane(plane)
    fail "Unable to land" if full_airport || weather
    @planes << plane
  end

  def take_off
    fail "Unable to take off" if no_planes || weather
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
