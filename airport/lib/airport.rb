require_relative "plane"

class Airport

  attr_reader :plane

  def land(plane)
    raise "Airport is full" if @plane
    @plane = plane

  end

  def take_off(plane)
    "#{plane} is no longer in the airport"
  end

end
