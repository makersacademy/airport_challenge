def weather
  x = rand(100)
  if x <= 50
    @weather = "stormy"
  elsif x > 50 
    @weather = "sunny"
  end
end

weather 