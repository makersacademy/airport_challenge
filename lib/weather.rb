class Weather
  def stormy?
    @stormy = randomise
  end

  def randomise
    rand(5) == 1
  end
end
