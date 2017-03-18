module Weather

  def rand_generator
    num = Random.new
    num.rand(100)
  end

  def check_weather

    return "Stormy" if rand_generator >= 95
    return "Safe to fly"
  end

  module_function :check_weather
  module_function :rand_generator

end

50.times {puts Weather.check_weather}
