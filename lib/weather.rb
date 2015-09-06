module Weather
  def weather
    weather = rand(100)
    weather <= 20 ? @stormy : @sunny
  end
end
