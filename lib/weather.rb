class Weather
  attr_reader :weather

  def weather
    rand > 0.8 ? "stormy" : "sunny"
  end
end