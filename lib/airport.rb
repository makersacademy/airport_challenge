require_relative 'plane'

class Airport

  attr_reader :planes_landed
  attr_reader :planes_taken_off

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
    @planes_taken_off = []
  end

  def land(plane)
    raise 'Plane unable to land, weather is stormy' if stormy?
    raise 'Plane unable to land, airport full' if full?
    @planes_landed.push(plane)
  end

  def take_off(plane)
    raise 'Plane unable to take off, weather is stormy' if stormy?
    @planes_taken_off.push(plane)
  end

private

  def full?
    @planes_landed.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end

end
