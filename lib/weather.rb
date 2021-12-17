class Weather 
  
  attr_reader :weather_indicator

  def initialize
    storm_selector = rand(1..20)
    if storm_selector == 20
      @weather_indicator = "Storm"
    else
      @weather_indicator = "Clear"
    end
  end

  def stormy?
    if @weather_indicator == "Storm"
      true
    elsif @weather_indicator == "Clear"
      false
    end
  end

end
