class Airport

  attr_reader :airport_name, :capacity, :weather

  def initialize(airport_name: "Airport", capacity: 1, weather: "calm")
    @airport_name = airport_name
    @capacity = capacity
    @weather = weather
  end

  def storm_switch
    if @weather == "storm"
      @weather = "calm"
    else
      @weather = "storm"
    end
    self
  end

end
