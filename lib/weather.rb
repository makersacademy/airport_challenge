module Weather
  def weather
    weather = rand(10)
    weather <= 2 ? @stormy : @sunny
  end
end
