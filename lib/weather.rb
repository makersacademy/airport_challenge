class Weather
  attr_reader :weather
  def initialize
    @weather = create_weather
  end

  def create_weather
   (rand(2) == 1) ? (return "stormy") : (return "fair")
  end

  def stormy?
    return true if @weather == "stormy"
    false
  end
end
