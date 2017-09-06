class Weather
  def number
    rand(1..100)
  end

  def stormy?
    number > 70 ? true : false
  end
end

#When the weather is stormy, prevent take-off
#When the weather is stormy, prevent landing
#create a method stormy
#If it stormy do the above else leave the methods alone
