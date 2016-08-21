module Weather

  def zeus
    rand(5)
  end

  def weather_report
    zeus
    zeus == 4 ? "stormy" : "sunny"
  end
  
end
