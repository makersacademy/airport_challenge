require_relative 'plane'

class Airport

  attr_reader :capacity, :planes


  def initialize
    @capacity = 20
    @planes = []
  end

  def allow_take_off
      plane = planes.pop
      plane.take_off
  end

  def allow_land(plane)
    if full?
      raise "Airport is full pilot.."
    else
      plane.land
      planes << plane
    end
  end

  private

  def full?
    planes.count >= capacity
  end
end
