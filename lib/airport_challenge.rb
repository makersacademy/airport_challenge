require_relative './plane'

class Airport

  def land(plane)
    @plane = plane
  end

  def take_off(plane)
    @plane = plane
  end

  def confirm_take_off
    'Plane successfully taken off'
  end
end
