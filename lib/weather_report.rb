class WeatherReport
  def stormy?
    Kernel.rand(1..4) > 3
  end
end
