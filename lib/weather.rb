class Weather

  def stormy?
    weather = rand(6)
    return true if weather > 3
    return false
  end

end
