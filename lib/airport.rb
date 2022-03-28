class Airport
  DEFAULT_CAPACITY = 60
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def weather
    forecast = rand(1..10)
    forecast == 10 ? "Stormy" : "Sunny"
  end
end
