class Weather

  def stormy?
    choose = rand(5)
    WEATHER[choose] == :stormy
  end

  private

  WEATHER = [:stormy, :sunny, :sunny, :sunny, :sunny]

end
