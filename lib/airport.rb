require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes_landed, :weather, :capacity

  def initialize(capacity = 10)
    @planes_landed = []
    @weather = Weather.new
    (capacity.is_a? Integer) ? @capacity = capacity : @capacity = 10
  end

  def land(plane)
    fail 'plane already landed in airport!' if in_airport?(plane) == true
    fail 'cannot land when stormy' if @weather.stormy_currently? == true
    fail 'cannot land - airport full' if @planes_landed.count >= @capacity

    @planes_landed << plane
  end

  def take_off(plane)
    fail 'cannot take off, plane not in airport!' if in_airport?(plane) == false
    fail 'cannot take off when stormy' if @weather.stormy_currently? == true

    @planes_landed.delete(plane)
  end

  def edit_capacity=(new_capacity)
    fail 'less than current planes' if new_capacity < @planes_landed.count

    @capacity = new_capacity
  end

  def in_airport?(plane)
    @planes_landed.include? plane
  end

end
