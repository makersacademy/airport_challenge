module Weather
  def is_stormy?
    storm_generator = rand(5) + 1
    return true if storm_generator == 5
    return false
  end
end