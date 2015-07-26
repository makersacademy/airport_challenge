require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 75

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
    flying_plane = planes.pop
    flying_plane.takeoff
    flying_plane
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
