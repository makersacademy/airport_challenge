require_relative 'airport'

class Plane

  def landed?(airport)
    (airport.planes).include?(self)
  end

end
