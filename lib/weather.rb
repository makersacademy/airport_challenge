module Weather
  possible_weather = ["Sunny", "Stormy", "Sunny", "Sunny"]
  def safe?
    !(possible_weather.sample != "Stormy")
  end
end
