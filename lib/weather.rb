class Weather

  def stormy?
    atmosphere >= 8 ? true : false
  end

  def atmosphere
    atmos = rand(10)
  end

end
