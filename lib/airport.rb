require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    airport_full?
    plane.landed
    @planes << plane
  end

  attr_reader :planes

  def take_off(plane)
    airport_empty?
    plane.departed
    @planes.pop
  end

  def airport_full?
    fail 'Airport is full, plane cannot be landed.' if @planes.length == 1
  end

  def airport_empty?
    fail 'No planes are currently at the airport' if @planes.empty?
  end
end
