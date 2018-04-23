class Weather
  attr_writer :stormy_weather

  def random
    rand(0.0..1.0)
  end

  def stormy_conditions?
    @stormy_weather = random < 0.2
  end

end
