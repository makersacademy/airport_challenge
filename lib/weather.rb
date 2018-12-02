class Weather
  def stormy?
    Kernel.rand(0..6) > 4
  end
end
