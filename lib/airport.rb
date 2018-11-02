class Airport

  def land(plane)
    plane
  end

  def takeoff(plane)
    check_stormy ? "it is too stormy to take off" : "#{plane} has taken off"
  end

  private
  
  def check_stormy
    weather = rand(10)
    weather < 8 ? stormy = false : stormy = true
  end

end
