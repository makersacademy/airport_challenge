class Weather
  def stormy?
    return true if Random.rand(10) > 8
    false
  end
end
