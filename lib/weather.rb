class Weather

  def stormy?
    # Kernel is used for stubbing randomness
    Kernel.rand(10) > 5
  end

end
