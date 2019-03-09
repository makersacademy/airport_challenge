class Weather

  def stormy?
    return true if random > 10
    
    false
  end

  def random
    rand(1..100)
  end

end
