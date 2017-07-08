require_relative 'weather'

class Airport
  attr_reader :plane, :weather
  # def plane
  #   @plane
  # end

  def initialize
    @weather = Weather.new
  end

  def land(plane)
    # fail 'Storms prevent landing' if weather.stormy?
    @plane = plane
  end

  def take_off(plane)
    fail 'Storms prevent take off' if weather.stormy?
    @plane = nil
    "#{plane} has taken off"
  end

end
