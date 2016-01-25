class Weather

  def stormy?
    Kernel.rand(0..13) == 13
  end
end
