require './lib/plane'

class Airport

  attr_reader :runway
  attr_reader :capacity

  def initialize(capacity = 20)
    @runway = Array.new
    @capacity = capacity
  end

  def land_plane(plane)
    return unless plane.flying? == false

    full?
    plane.landed
    @runway << plane
  end

  def full?
    raise StandardError.new "Runway full: maintain holding pattern" unless @runway.length < @capacity
  end

  def take_off(plane)
    return if plane.flying? == true #  && hanger.empty?
    plane.in_air
    #  @hangar.pop
  end
end
