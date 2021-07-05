class Weather
  def forecast
    number = rand(0..100)
    number >= 95 ? "Stormy" : "Sunny"
  end
        
  def conditions
    fail "To stormy cannot take off/land." if forecast == "Stormy"
  end
end