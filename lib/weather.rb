class Weather

  def create
    types = ["sunny","cloudy","stormy","rainy"]
    Kernel.rand(types.length)
  end
  
end
