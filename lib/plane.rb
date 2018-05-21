class Plane

  def initialize
    @weather = weather
  end

  def weather
    #["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"].sample
    return "stormy" if rand(11) > 9
    "sunny"
  end

  def bad_weather
    @weather = "stormy"
  end

  def stormy?
    #true if @weather == "stormy"
    @weather == "stormy"
  end

end
