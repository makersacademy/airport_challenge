require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 9001

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing_plane(plane)
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  def weather
    @weather ||= Weather.new.stormy
  end

end
