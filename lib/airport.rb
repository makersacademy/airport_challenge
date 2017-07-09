require_relative 'weather'

class Airport
  attr_reader :plane, :weather
  # def plane
  #   @plane
  # end

  def initialize
    @weather = Weather.new
    @planes = []
  end

  def land(plane)
    # fail 'Storms prevent landing' if weather.stormy?
    fail 'Airport full' if @planes.count >= 100
    @plane = plane
    @planes << plane
  end

  def take_off(plane)
    fail 'No planes currently at the airport' unless @plane
    fail 'Storms prevent take off' if weather.stormy?
    @planes.delete(plane)
    @plane = nil
    "#{plane} has taken off"
  end

end
