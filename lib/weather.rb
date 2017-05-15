class Weather

  def stormy?
    randomizer < 3
  end

  def randomizer
    rand(10) + 1
  end
end
