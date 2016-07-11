require_relative 'airport'
class Airplane

  def land(airport = (no_argument_passed = true; nil))
    raise 'No airport specified' if no_argument_passed
    raise 'Plane is already landed' if landed?
    airport.accept_plane(self)
  end

  def takeoff(airport = (no_argument_passed = true; nil))
    raise 'No airport specified' if no_argument_passed
    raise 'Plane is already flying' if flying?
    raise 'Plane is not in specified airport' if !(airport.airplanes.include?(self))
    airport.release_plane(self)
  end

  def plane_landed
    @landed = true
  end

  def plane_flying
    @landed = false
  end

  def landed?
    @landed
  end

  def flying?
    !@landed
  end

end
