require_relative 'plane'

class Airport



  def initialize(capacity = 1)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    fail 'Hangar full' if full?
    @hangar << @plane
    "Plane landed safely"
  end

  def take_off
    @hangar.pop
    "Plane has left the runway"
  end

private
  def full?
    @hangar.size >= @capacity
  end

end
