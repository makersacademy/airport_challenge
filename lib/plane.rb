require_relative 'airport'

class Plane

attr_reader :status

  def land(airport)
    @status = "landed"
    airport.store(self)
  end

end
