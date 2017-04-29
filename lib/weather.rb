module Weather
# generates a random number from 1 to 100, returning "sunny" if it's 85 of lower, otherwise "stormy"
  def weather_today
    rand(101) <= 85 ? "sunny" : "stormy"
  end

end
