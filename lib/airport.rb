require_relative './plane.rb'

class Airport

  def land(plane)
    @plane = plane
    @plane.flying = false
  end

  def take_off
    fail "No plane at the airport" unless @plane
    fail "No plane at the airport" unless @plane.flying == false
    @plane.flying = true
    "#{@plane} has left the airport"
  end

end
