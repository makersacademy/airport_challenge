class Airport
  def test_method
  end
end

class Weather
  def stormy?
    return true if rand < 0.1
    false
  end
end