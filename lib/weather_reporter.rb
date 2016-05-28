class WeatherReporter
  def stormy?
    Kernel.rand(1..6) > 4
  end                      # => :stormy?
end                        # => :stormy?
