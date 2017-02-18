class Plane
  attr_accessor :status # plane can be at airport or in-flight

  def land(airport)
    fail "Invalid airport" unless airport.respond_to?(:chars) # duck typing
    self.status = "Landed at #{airport}"
  end

  def take_off(airport)
    fail "Invalid airport" unless airport.respond_to?(:chars)
    self.status = "In-Flight"
  end

end
