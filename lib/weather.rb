class Weather
  #stormy weather is equal to number 3
  def stormy? 
    (rand(5) + 1) == 3 ? true : false
  end  
end
