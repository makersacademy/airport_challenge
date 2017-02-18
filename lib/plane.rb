class Plane
  attr_accessor :status, :airport # plane can be at airport or in-flight

  def initialize(airport, status = "Landed")
    @airport = airport
    @status = status
  end

  def land(airport)
    fail "Invalid airport" unless airport.respond_to?(:permission_to_land) # duck typing
    self.status = "Landed"
    airport.confirm_landing(self)
  end

  def take_off(airport)
    fail "Invalid airport" unless airport.respond_to?(:permission_to_land)
    self.status = "In-Flight"
    airport.confirm_take_off(self)
  end

end
