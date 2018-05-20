class Plane

  attr_reader :weather

  def initialize
    @weather = weather
  end

  def weather
    ["sunny", "stormy"].sample
  end

  def bad_weather
   @weather = "stormy"
  end

  def stormy?
    true if @weather == "stormy"
  #  false if @weather == "sunny"
  end

end
