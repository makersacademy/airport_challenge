class Plane
  attr_reader :status, :airport

  def initialize(airport = "factory", status = "Brand New")
    @airport = airport # this variable is passed in during the land or take_off instruction
    @status = status # plane can be "Brand New", "Landed", "In-Flight"
  end

  def land(airport)
    fail "Invalid airport" unless airport.respond_to?(:permission_to_land) # duck typing
    self.status = "Landed"
    self.airport = airport
  end

  def take_off
    #fail "Invalid airport" unless airport.respond_to?(:permission_to_land)
    self.status = "In-Flight"
  end

  private
  attr_writer :status, :airport
end
