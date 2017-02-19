class Plane
  attr_reader :status, :airport # plane can be at airport or in-flight

  def initialize(airport, status = "Brand New")
    @airport = airport
    @status = status
  end

  def land(airport)
    fail "Invalid airport" unless airport.respond_to?(:permission_to_land) # duck typing
    self.status = "Landed"
    self.airport = airport
  end

  def take_off(airport)
    fail "Invalid airport" unless airport.respond_to?(:permission_to_land)
    self.status = "In-Flight"
  end

  private
  attr_writer :status, :airport
end
