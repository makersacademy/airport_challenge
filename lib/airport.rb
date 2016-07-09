require_relative 'plane'

class Airport

  def request_landing(plane)
    plane.land
  end

  def full?
    'full'
  end
end
