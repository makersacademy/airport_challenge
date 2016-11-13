class Weather

  def stormy?
    Kernel.rand(1..20) > 15
  end

end
