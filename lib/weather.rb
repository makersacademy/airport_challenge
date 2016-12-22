class Weather

  attr_accessor :weather_code

  def stormy?
    Kernel.rand < 0.3
  end

end
