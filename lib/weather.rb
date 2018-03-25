module Weather
  def stormy?
    Kernel.rand(10) == 1
  end
end
