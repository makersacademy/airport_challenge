class Weather

  def stormy?
    Kernel.rand(0..1) == 1
  end

end
