require 'airport'

class Plane

  attr_accessor :name, :location

  def initialize(name = 'concord', location = 'air')
    @name = name
    @location = location
  end

  def land(airport)
    fail 'plane already landed' if @location != 'air'
    fail 'weather is stormy' if stormy?
    fail 'hangar at capacity' if airport.full?

    airport.hangar << self
    @location = airport
  end

  def take_off
    fail 'weather is stormy' if stormy?
    fail 'already in the air' if @location == 'air'

    @location = 'air'
  end

  def stormy?
    true if rand(1..6) == 6
    false
  end

end
