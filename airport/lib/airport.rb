require_relative "plane"

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if @planes.count >= 30
    @planes << plane
  end

  def take_off(plane)
    "#{plane} is no longer in the airport"
  end

end
