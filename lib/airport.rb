class Airport
  attr_reader :capacity, :weather
  attr_accessor :landed_planes

  def initialize(capacity = 10)
    @landed_planes = []
    @capacity = capacity
    weather_number < 9 ? @weather = :sunny : @weather = :stormy
  end

  def weather_number
    weather_number = rand(9)
    return weather_number
  end
  
end
