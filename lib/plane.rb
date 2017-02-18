class Plane
  attr_accessor :status, :airport # plane can be at airport or in-flight

  def initialize(airport, status = "Landed")
    @airport = airport
    @status = status
  end

  def land(airport)
    fail "Invalid airport" unless airport.respond_to?(:is_full?) # duck typing
    self.status = "Landed"
  end

  def take_off(airport)
    fail "Invalid airport" unless airport.respond_to?(:is_full?)
    self.status = "In-Flight"
  end

end
