

class Weather

conditions = ['sunny', 'overcast', 'raining', 'mild', 'stormy']


  def random_weather
    conditions = ['sunny', 'overcast', 'raining', 'mild', 'stormy'].sample
  end

  def stormy?
    random_weather == 'stormy'
  end

end
