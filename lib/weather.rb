class Weather
  def stormy?
    return true if rand(0...6) == 0
    false
  end
end