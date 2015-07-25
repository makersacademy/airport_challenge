require_relative 'plane'

class Airport

  def release plane
    plane.take_off
  end

end
