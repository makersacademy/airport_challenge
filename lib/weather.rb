module Weather

  def stormy?
    (rand(50) == 25) ? @stormy = true : @stormy = false
  end
  
end
