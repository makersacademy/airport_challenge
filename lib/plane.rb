class Plane
  attr_reader :status, :location

  def initialize
    @location = "Factory" # this variable is passed in during the land or take_off instruction
    @status = "Brand New" # plane can be "Brand New", "Landed", "In-Flight"
  end

  def land(location)
    fail "Invalid airport" unless location.respond_to?(:chars) # duck typing
    self.status = "Landed"
    self.location = location
  end

  def take_off
    self.status = "In-Flight"
  end

  private
  attr_writer :status, :location
end
