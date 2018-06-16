require_relative './plane.rb'

class Airport

  def land(plane)
    @plane = plane
  end

  def take_off
    fail "No plane at the airport" unless @plane
    "#{@plane} has left the airport"
  end

end
