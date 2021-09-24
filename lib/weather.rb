module Weather
  def check_weather
    generate_random_number > 7 ? :stormy : :sunny
  end

  def generate_random_number
    rand(1..10)
  end
end
