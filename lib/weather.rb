class Weather

  def randomize(weight = 20)
    Kernel.rand <= weight/100.0
  end

end
