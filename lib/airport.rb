class Airport

  attr_reader :airport_name, :capacity, :planes, :weather

  DEFAULT_CAPACITY = 10

  def initialize(airport_name: "Airport", capacity: DEFAULT_CAPACITY, weather: "calm")
    @airport_name = airport_name
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def weather_change
    forecast = rand(2)
    forecast == 0 ? storm_switch : self
  end

  def storm_switch
    @weather == "calm" ? @weather = "storm" : @weather = "calm"
    self
  end

end
