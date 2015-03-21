class Plane
  attr_reader :status
  def initialize
    @status = 'flying'
  end

  def request_takeoff airport
    airport.order_plane_to_takeoff
  end

  def takeoff
    @status = 'flying'
  end

  def request_land # airport
    airport.landing_permission
  end

  def land # airport
    @status = 'landed' # if airport.landing_permission != 'permission denied'
  end

  def location
    @status == 'flying' ? 'air' : 'airport'
  end
end
