module Weather
  def stormy?
    return true if chance == 0

    return false
  end
  
  def chance
    rand(5)
  end

end
