require_relative 'plane'

class Airport
attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off
    fail "Airport is empty" unless @plane
    @plane
  end



end
