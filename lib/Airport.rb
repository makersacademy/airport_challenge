require_relative "Aeroplane.rb"

require_relative "Weather.rb"

class Airport

  attr_accessor :planes, :weather

  def initialize
    @planes = []

  end

  def takeoff(plane, weather)
    fail "#{plane} Cannot take off" if weather == "stormy"
    @planes.delete(plane)
  end

  def land(plane, weather)
    fail "#{plane} Cannot land" if weather == "stormy"
    @planes << plane
  end

end
