class Weather
  def stormy?
    if calculate == 3
    return true
  else
    return false
  end
end
  def calculate
    rand(4)
  end
end
 # basic rng for stormy weather
