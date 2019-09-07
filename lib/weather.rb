class Weather
  def conditions
    ["sunny", "cloudy", "raining", "windy", "stormy"]
  end

  def current_conditions
    conditions.sample
  end
end
