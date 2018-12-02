require_relative "Aeroplane.rb"

class Airport

  attr_accessor :planes, :default_capacity

  def initialize(weather = rand(100))
    @planes = []
    @weather = (weather > 75 ? "stormy" : "clear")
    @default_capacity = 5
  end

  def takeoff(plane)
    fail "#{plane} Cannot take off" if weather == false
    @planes.delete(plane)
  end

  def land(plane)
    fail "#{plane} Cannot land" if weather == false
    @planes << plane
  end

  def weather
    @weather == "stormy" || @planes.count > default_capacity ? false : true
  end

end
