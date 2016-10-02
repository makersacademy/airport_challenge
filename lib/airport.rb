class Airport
  @rng = Random.new
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def weather
    ["sun", "storm", "clouds", "fog", "rain", "snow"].sample(@rng).lowercase
  end

  def add(plane)
    @planes << plane
  end

  def remove(plane)
    @planes.delete(plane)
  end


end
