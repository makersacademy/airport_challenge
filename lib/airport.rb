class Airport
  DEFAULT_CAPACITY = 60
  attr_reader :hangar, :capacity
  attr_accessor :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def check_weather
    forecast = rand(1..10)
    forecast == 10 ? "Stormy" : "Sunny"
  end
end
