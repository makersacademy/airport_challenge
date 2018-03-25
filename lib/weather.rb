class Weather
  def stormy?
    Kernel.rand(1..9) > 6
  end
end
