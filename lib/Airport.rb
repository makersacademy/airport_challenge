require_relative "Aeroplane.rb"

class Airport

  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 25

  def initialize(weather = rand(100), airport_capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = (weather > 75 ? "stormy" : "clear")
    @capacity = airport_capacity
  end

  def takeoff(plane)
    fail "#{plane} Cannot take off" if weather? || full?
    @planes.delete(plane)
  end

  def land(plane)
    fail "#{plane} Cannot land" if weather? || full?
    @planes << plane
  end

  def weather?
    @weather == "stormy"
  end

  def full?
    planes.count >= @capacity
  end

end
