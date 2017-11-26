

class Weather

conditions = ['sunny', 'stormy']


  def random_weather
    conditions.sample
  end

  def stormy?
    random_weather == 'stormy'
  end

end
