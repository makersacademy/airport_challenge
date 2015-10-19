module Weather

  def stormy?
    random_weather == :stormy
  end

private

  def random_weather
    incidence = rand(364)
    return :sunny if incidence <= 340
    return :stormy
  end

end
