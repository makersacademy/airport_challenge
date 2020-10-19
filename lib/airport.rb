class Airport
  attr_reader :capacity
  attr_accessor :planes
  def initialize(capacity = 10)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    return "Airport full, go away." unless @planes.count < @capacity
    return "No landing in stormy weather." if weather_bad?

    @planes << plane
    "Landing!"
  end

  def take_off(plane)
    return "That plane is not here." unless @planes.include?(plane)
    return "No flying in stormy weather." if weather_bad?

    @planes.delete(plane)
    "I, #{plane}, have taken off."
  end

  def weather_bad?
    rand(1..6) == 1
  end
end
