require_relative 'plane'

class Airport
  def land(plane)
    fail "Airport full" if @plane

    @plane = plane
  end

  def take_off
    fail "No planes" unless @plane
    @plane
    "The plane is in the air"
  end
end
