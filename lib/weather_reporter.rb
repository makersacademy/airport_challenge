module WeatherReporter

  def random_number_generator
    rand(10)
  end

  def stormy?
    random_number_generator >= 7
  end

end
