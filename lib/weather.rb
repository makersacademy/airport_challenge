class Weather
  def stormy?
    prob = rand(10)
    prob < 3 #20% chance to be stormy
  end
end
