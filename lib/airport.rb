require_relative 'plane'

class Airport

  def request_landing(plane)
    plane.land
  end

  def request_take_off(plane)
    plane.take_off
  end

  def full?
    'full'
  end
end
