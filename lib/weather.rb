module Weather
  def stormy?
    storm_generator = rand(1..5)
    return true if storm_generator == 5

    return false
  end
end
