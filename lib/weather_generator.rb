class WeatherGenerator

  def generate_random_weather(storm_probability)
    raise "Invalid storm probability." if storm_probability > 100 || storm_probability < 0
    pick_array = []
    storm_probability.times{ pick_array.push(0) }
    (100 - storm_probability).times{ pick_array.push(1) }
    return pick_array[(0..99).to_a.sample]
  end

end
