class Weather
  def stormy?
    return true if calculate == 3

    return false
  end

  def calculate
    rand(4)
  end
end
