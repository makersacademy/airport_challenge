class Weather 

  def Weather_condition
    number = rand(50)
    if number < 40
      puts "sunny"
      return true  
    else 
      puts "stormy"
      return false  
    end 
 end 
end 
