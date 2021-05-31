require_relative 'airport'

class Plane
  attr_reader :flying, :plane

  def takeoff
    if @flying
      'Plane is already flying'
    else
      @flying = true
      'Plane has taken off and is no longer at the airport'
    end
  end

  def land
    unless @flying
      'Plane is already on the ground'
    else
      @flying = false
      'Plane has landed'
    end
  end
end
