class Weather
  attr_reader :weather

  def initialize
    i = rand(6)
    if i >= 5
      @weather = "stormy"
    else
      @weather = "fine"
    end
  end
  def stormy?
    true if @weather.weather  == "stormy"
  end 
end
