require_relative 'plane'

class Airport

  # def initialize
  #   @planes = []
  # end

  def request_take_off(plane)
    plane.take_off_from(self)
  end

  def request_landing(plane)
    plane.land_at(self)
  end

  def has_plane?(plane)
    plane.landed_at?(self)
  end

end
