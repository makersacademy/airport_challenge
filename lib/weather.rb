module Weather
# random weather generator
  def stormy?
    chance_of_storm = rand(10)
    chance_of_storm == 2
    # returns true to the question stromy 10% of the time
  end

end
