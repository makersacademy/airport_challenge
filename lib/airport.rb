require_relative 'plane.rb'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def call_landing(plane)
    if airport_full?
      raise "Airport is full, keep flying"
    else
      plane_landed(plane)
    end
  end

  def call_takeoff
    plane = planes.pop
    plane.takeoff
    plane
  end

private

  def airport_full?
    planes.count >= capacity
  end

  def plane_landed(plane)
    plane.land
    @planes << plane
    plane
  end

end
