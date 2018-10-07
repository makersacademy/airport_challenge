# This is a class for planes
require_relative 'airport'

class Plane

  # Defines the landing feature of planes
  def landed(airport)
    airport.is_a?(Airport)
  end

  # Defines the takeoff feature
  def flying

  end

end
