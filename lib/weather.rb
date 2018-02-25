class Weather
  def stormy?
    return true if rand(10) > 8
    false
  end
end
