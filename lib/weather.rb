module Weather
  attr_reader :weather

  def weather
    @weather = "stormy"
  end

  def stormy?
    @weather == "stormy"
  end
end
