require_relative 'plane'

class Airport
  attr_reader :planes
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = 10
  end

  def take_off
    fail 'Airport empty. No planes to taxi' if empty?
    fail 'Severe weather. Unable to take off' if stormy?
    planes.pop
  end

  def landing(plane)
    fail 'Airport full. Unable to land' if full?
    fail 'Severe weather. Unable to land' if stormy?
    # plane.status=('grounded')
    planes << plane
  end

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end

  def stormy?
    chance_of_storm = rand(10)
    if chance_of_storm <= 8
      false
    else
      true
    end
  end

end
