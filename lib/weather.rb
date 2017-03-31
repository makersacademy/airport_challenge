module Weather


  def rand_generator
    rand(100)
  end

  def check_weather
    return :stormy if rand_generator >= 95
    return :safe_to_fly
  end

  module_function :check_weather
  module_function :rand_generator


end
