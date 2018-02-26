class Weather

  def storm?
    var = rand(1..6)
    return true if var == 6
    else
      return false
  end
end
