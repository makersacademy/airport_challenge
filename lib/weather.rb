class Weather
    STORM_PERCENTAGE = 15

  def stormy?
    true if rand(1..100) <= STORM_PERCENTAGE
  end

end
