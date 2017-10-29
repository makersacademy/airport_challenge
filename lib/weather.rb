class Weather

  def stormy?
    forecast = [:stormy, :sunny, :sunny, :sunny]
    index = 1
    forecast[index] == :stormy
  end

end
