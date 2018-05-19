class Weather

  def stormy?
    weather = rand(6)
    if weather > 3
      return true
    else
      return false
    end
  end

end
