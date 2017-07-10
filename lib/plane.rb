require_relative 'airport'

class Plane

  def landed?(airport)
    airport.in_airport? self
  end

end
