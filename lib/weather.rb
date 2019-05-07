class Weather

  def forecast
    Kernel.rand(1..100) > 10 ? "Clear" : "Stormy"
  end

end
