require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes_landed, :weather

  def initialize
    @planes_landed = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'cannot land when stormy' if @weather.stormy_currently? == true

    @planes_landed << plane
  end

  def take_off(plane)
    fail 'cannot take off when stormy' if @weather.stormy_currently? == true

    @planes_landed.delete(plane)
  end

end
