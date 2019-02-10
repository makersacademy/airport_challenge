require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes_landed, :weather, :airport_capacity

  def initialize(airport_capacity)
    @planes_landed = []
    @weather = Weather.new
    @airport_capacity = airport_capacity
  end

  def land(plane)
    fail 'cannot land when stormy' if @weather.stormy_currently? == true
    fail 'cannot land when airport full' if @planes_landed.count >= @airport_capacity

    @planes_landed << plane
  end

  def take_off(plane)
    fail 'cannot take off when stormy' if @weather.stormy_currently? == true

    @planes_landed.delete(plane)
  end

end
