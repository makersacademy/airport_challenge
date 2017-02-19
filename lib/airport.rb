require_relative 'plane'
require_relative 'weather'

class Airport
  MAX_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity = MAX_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if airport_full?
    plane.landed
    @planes << plane
  end

  def take_off
    raise "Airport is empty" if airport_empty?
    plane = @planes.pop
    plane.flying
    plane
  end

  private

  def airport_full?
    @planes.count == capacity
  end

  def airport_empty?
    @planes.empty?
  end

end
