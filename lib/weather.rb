class Weather

  def generate_weather
    rand(10) <= 7 ? 'sunny' : 'stormy'
  end

end