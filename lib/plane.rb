class Plane
  attr_accessor :is_inflight
  DEFAULT_LAND_STATE = true


  def initialize
    @is_inflight = DEFAULT_LAND_STATE
  end

  def flying?
    is_inflight
  end

  def land(airport)
    fail 'Plane already on ground' unless self.flying?
    self.is_inflight = false if airport.request_land?(self)
  end

  def takeoff(airport)
    fail 'Plane already flying' if self.flying?
    self.is_inflight = true if airport.request_takeoff?(self)
  end


end
