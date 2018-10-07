class Weather
  def stormy?
    # generates a random number from 1 to 10
    # if the number is bigger than 8, sets the weather to stormy
    # this way, it's much more likely
    # to be sunny (8 out of 10, or roughly 80% of the time)
    rand(1..10) > 8
  end
end
