
class Plane

  def weather
    bad_weather = "Apologies due to bad weather you'll not be able to land!"
    good_weather = "Welcome, you're clear to land"
      random_number = rand(11)
      weather_result = random_number == 1 || random_number == 4 ? bad_weather : good_weather
    weather_result
  end

end
