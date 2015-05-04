class Plane
  attr_reader :status, :locations

  def initialize
    @status = 'flying'
  end

  def land airport
    airport.permission_to_land self
  end

  def location
    @status == 'flying' ? 'air' : 'airport'
  end
end
