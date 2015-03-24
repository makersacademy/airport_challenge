class Plane
  attr_reader :status, :location
  def initialize
    @status = 'flying'
  end

  def request_land airport
    airport.landing_permission self
  end

  def land(*) # should be (airport), (*) for Rubocop
    fail 'already landed' if @status == 'landed'
    @status = 'landed'
  end

  def request_takeoff airport
    airport.order_plane_takeoff self
  end

  def takeoff
    fail 'already flying' if @status == 'flying'
    @status = 'flying'
  end

  def location
    @status == 'flying' ? 'air' : 'airport'
  end
end
