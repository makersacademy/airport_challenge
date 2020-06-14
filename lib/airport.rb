require_relative 'plane'
require_relative 'wrong_state_error'
require_relative 'wrong_airport_error'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    raise WrongStateError, 'this plane is not flying' if plane.state == :landed

    @planes << plane
    plane.change_state(:landed)
  end

  def take_off(plane)
    raise WrongStateError, 'this plane is already flying' if plane.state == :flying
    raise WrongAirportError, 'that plane is not at this airport' if !@planes.include?(plane)

    @planes -= [plane]
    plane.change_state(:flying)
  end
end
