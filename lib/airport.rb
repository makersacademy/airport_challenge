require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def confirm_landing(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
    @planes
  end

end
