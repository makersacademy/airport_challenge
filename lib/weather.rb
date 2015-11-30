
class Weather
  attr_reader :weather

  def stormy?
    weather_possibilities = [:storm,:no_storm,:no_storm,:no_storm]
    possibility = Kernel.rand(0..3)
    weather_possibilities[possibility] == :storm

  end
end
