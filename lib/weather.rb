class Weather
  attr_reader :weather
  def initialize
    @weather = rand(1..20)
    @stormy = stormy
  end

  def stormy
    return "stormy" if weather >= 10 
  
    "clear"
  end
end
