class Weather
  def stormy?
    prob < 3 #20% chance to be stormy
  end

  def prob
    rand(10)
  end
end
