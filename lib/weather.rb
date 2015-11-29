class Weather

  def weather_report
    weather_array = []
    weather_array = ['sunny','sunny','sunny','sunny','stormy']
    weather_array.at(rand(0..4))
  end

end
