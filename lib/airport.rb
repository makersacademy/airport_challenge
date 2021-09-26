class Airport
  attr_reader :capacity, :stormy_weather
  attr_accessor :landed_planes

  def initialize(capacity = 10)
    @landed_planes = []
    @capacity = capacity
    @stormy_weather = stormy?
  end

  def stormy?
    rand(9) < 9
  end
  
end
