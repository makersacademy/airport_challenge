class Weather

  def forecast
    randomiser = rand(4)
    randomiser == 1 ? "Stormy" : "Sunny"
  end

end
