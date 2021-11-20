require_relative 'plane'

class Airport

  attr_reader :name, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "airport full: cannot land plane here" if @planes.length >= @capacity 
    @planes << plane
    plane
  end

  def take_off(plane)
    raise "plane cannot take off, weather is stormy" if weather == "stormy"
    @planes.delete(plane)
    "sucessful take off of #{plane} from #{@name}"
  end

  def weather
    rand(10) == 1 ? "stormy" : "sunny"
  end
end
