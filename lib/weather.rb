class Weather 
  def randomizer
    rand(1..10) 
  end 

  def stormy?
    randomizer >= 8
  end 
end 
