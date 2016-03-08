class Weather
  def stormy?
    Kernel.rand(1..4) % 4 == 0
  end
end
