class Weather
  def stormy?
    # Sunny on average 80% of the time
    n  = rand(9)
    n < 1 ? true : false
  end
end