class Weather

  def stormy?
    weather == 2
  end
  private

  def weather
    rand(1..10)
  end

end
