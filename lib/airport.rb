class Airport
  attr_reader :capacity
  attr_accessor :planes
  def initialize(capacity = 10)
    @capacity = capacity
    @planes = []
    rand(1..6) == 1 ? @weather = "stormy" : @weather = "sunny"
  end

  def land(plane)
    return "Airport full, go away." unless @planes.count < @capacity
    return "No landing in stormy weather." if @weather == "stormy"

    @planes << plane
    "Landing!"
  end

  def takeoff(plane)
    return "No flying in stormy weather." if @weather == "stormy"
    return "That plane is not here." unless @planes.include?(plane)

    @planes.delete(plane)
    "I, #{plane}, have taken off."
  end
end
