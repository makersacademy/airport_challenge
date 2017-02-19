require_relative 'plane'

class Airport

attr_reader :plane

  def lands_plane(plane)
      plane.land
    end

  def take_off(plane)
    plane.flying

  end

end
