class Weather
  def stormy?
    Kernel.rand(1..6) > 4
  end
end
