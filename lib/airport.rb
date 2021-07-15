require_relative 'plane'

class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @grounded_planes = []
  end

  def land(plane)
    raise "Cannot land anymore plane, airport is full." if @grounded_planes.count >= @capacity 
    raise 'Weather not suitable for landing' if @weather == "Stormy"
    @grounded_planes << plane
  end

  def take_off(plane)
    plane
  end

  def weather?
    @weather = ["Sunny", "Stormy"]
    @weather[rand(2)]
  end
  
end