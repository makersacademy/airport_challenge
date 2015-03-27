require_relative 'plane'

class Airport
  CAPACITY = 6

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    permission_to_transit
    fail 'Airport is full' if airport_full?
    planes << plane
    plane.ground
  end

  def take_off(plane)
    permission_to_transit
    fail 'Airport is empty' if airport_empty?
    planes.delete(plane)
    plane.ground
  end

  def weather
    %w(Sunny Stormy).sample
  end

  def permission_to_transit
    fail 'Poor weather, not transit' if poor_weather?
  end

  def poor_weather?
    weather == 'Stormy'
  end

  def airport_empty?
    planes.empty?
  end

  def airport_full?
    planes.length >= CAPACITY
  end
end
