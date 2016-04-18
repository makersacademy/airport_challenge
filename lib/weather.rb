class Weather

  WEATHER = [:stormy, :sunny, :sunny, :sunny, :sunny]

  def stormy?
    choose = rand(5)
    WEATHER[choose] == :stormy
  end

end
