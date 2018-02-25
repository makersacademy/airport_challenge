class Weather
  def stormy?
    return false if Random.rand(10) < 8
    true
  end
end
