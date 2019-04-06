require_relative 'plane'

class AirPort

  def initialize
    @track_landed_plane = []
  end

  def land(plane)
    @track_landed_plane.push(plane)
  end

  def take_off(plane)
    plane
  end

end
