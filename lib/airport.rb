class Airport

  attr_reader :capacity, :weather

  def initialize(capacity: 1, weather: "calm")
    @capacity = capacity
    @weather = weather
  end

end
