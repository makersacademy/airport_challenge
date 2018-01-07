class Weather

  def stormy?
    forecast = [:stormy, :sunny, :sunny, :sunny]
    index = rand(4)
    forecast[index] == :stormy
  end

end
