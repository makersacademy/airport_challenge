class Weather
    
  def stormy?
    x = rand(1..100)
    x.between?(1, 90) ? false : true
  end
  
end
