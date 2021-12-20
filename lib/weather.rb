class Weather 
  
  attr_reader :weather_indicator

  def initialize
    if rand(1..20) == 20
      @weather_indicator = "Storm"
    else
      @weather_indicator = "Clear"
    end
  end

  def stormy?
    @weather_indicator == "Storm"
  end

end
