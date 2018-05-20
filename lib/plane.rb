class Plane

  def initialize
    @weather = weather
  end

  def weather
    ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"].sample
  end

  def bad_weather
    @weather = "stormy"
  end

  def stormy?
    true if @weather == "stormy"
  end

end
