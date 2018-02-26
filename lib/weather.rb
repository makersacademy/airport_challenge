class Weather

  def storm?
    var = rand(1..6)
    return false if var == 6
    else
      return true
  end
end
