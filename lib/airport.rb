require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes_landed, :weather, :capacity

  def initialize(airport_capacity = 10)
    @planes_landed = []
    @weather = Weather.new
    @capacity = airport_capacity
  end

  def land(plane)
    fail 'cannot land when stormy' if @weather.stormy_currently? == true
    fail 'cannot land - airport full' if @planes_landed.count >= @capacity

    @planes_landed << plane
  end

  def take_off(plane)
    fail 'cannot take off when stormy' if @weather.stormy_currently? == true

    @planes_landed.delete(plane)
  end

  def edit_capacity=(new_capacity)
    @capacity = new_capacity
  end

  def in_airport?(plane)
    @planes_landed.include? plane
  end

end
