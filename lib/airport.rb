require 'weather'

class Airport
attr_reader :spaces

  def initialize
    @spaces = []
  end

  def land(plane)
    raise 'It is too stormy to land' if stormy?

    plane
  end

  def takeoff(plane)
    raise 'Weather is too stormy to takeoff' if stormy?

    plane_taken_off
    plane
  end

  private

  def stormy?
    @stormy
  end

  def plane_taken_off
    'Plane has taken off'
  end
end
