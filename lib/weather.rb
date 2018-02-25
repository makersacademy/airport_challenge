class Weather
  def stormy?(random = rand(0))
    return true if random <= 0.3
    false
  end
end
