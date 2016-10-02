class Plane

  attr_reader :status

  def initialize
    @status = 'in flight'
  end

  def land(airport)
    airport.cleared_landing(self)
    @status = 'landed'
  end
end
