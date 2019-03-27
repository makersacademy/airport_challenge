class Weather
  
  def stormy?
    if rand(1..10) > 8 
      true 
    else
      false
    end
  end

end