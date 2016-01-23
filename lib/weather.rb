class Weather
  def stormy?
    true if rand(0...6) == 0
    false
  end
end