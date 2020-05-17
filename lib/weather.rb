class Weather

  def weather_generator
    conditions = ["sunny", "sunny", "sunny", "stormy", "sunny", "sunny"]
    r = rand 0..5
    conditions[r]
  end

  def check_conditions
    weather_generator
  end

end