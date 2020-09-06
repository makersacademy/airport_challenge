module Weather
  def generate_weather
    @weather_states = ["sunny", "sunny", "stormy"]
    @weather_states.sample
  end
end
