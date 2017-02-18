require 'plane'

class Airport

  def land(plane)
    @plane = plane
  end

  def confirm_landing
    "The #{@plane} has landed at #{self}."
  end

end
