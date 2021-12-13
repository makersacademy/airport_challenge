# Weather class
class Weather
  def random
    rand(5)
  end

  def forecast
    forecast = {
      0 => 'clear',
      1 => 'clear',
      2 => 'clear',
      3 => 'clear',
      4 => 'stormy'
    }

    random_number = random
    @forecast = forecast[random_number]
  end

  attr_reader = :forecast
end
