class Weather

  def conditions
    randomizer == 1 ? "Stormy" : "Sunny"
  end

  def randomizer
    return rand(1..5)
  end

end
# weather = Weather.new
# p weather.conditions
