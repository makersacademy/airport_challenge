class Weather
  def storm?
    Kernel.rand(1..4) > 2
  end
end
