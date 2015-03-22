class Plane
  attr_reader :status
  def initialize
    @status = 'flying'
  end

  def request_land # airport
    airport.landing_permission
  end

  def land # airport
    fail 'already landed' if @status == 'landed'
    @status = 'landed' # if airport.landing_permission != 'permission denied'
  end

  def request_takeoff airport
    airport.order_plane_to_takeoff
  end

  def takeoff
    fail 'already flying' if @status == 'flying'
    @status = 'flying'
  end

  def location
    @status == 'flying' ? 'air' : 'airport'
  end
end
