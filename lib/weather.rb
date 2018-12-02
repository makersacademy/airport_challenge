class Weather
  def stormy
    return true if rand(100) < 40
    false
  end
end
