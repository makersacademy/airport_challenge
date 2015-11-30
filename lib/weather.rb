class Weather
  def stormy?
    Kernel.rand(1..10) >= 7
  end
end
