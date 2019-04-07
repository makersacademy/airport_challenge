module Weather
  attr_reader :weather

  def weather
    @weather = rand(5) == 3 ? "stormy" : "sunny"
  end

  def stormy?
    @weather == "stormy"
  end
end
