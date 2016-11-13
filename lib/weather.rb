class Weather
  def stormy?
    values[random] == :stormy
  end

  def random
    rand(4)
  end

  def values
    [:stormy,:sunny,:sunny,:sunny]
  end
end
