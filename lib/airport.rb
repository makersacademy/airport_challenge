require_relative "plane"

class Airport

  def land(plane)
    is_flying?(plane)
  end

  def is_flying?(plane)
    plane.landed?
  end

end
