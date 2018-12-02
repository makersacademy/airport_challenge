require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
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
