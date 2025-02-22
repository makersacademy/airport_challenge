class Weather
  def stormy?
    Kernel.rand(1..10) > 4
  end
end