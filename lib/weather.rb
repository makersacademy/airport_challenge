module Weather
  def chance_of_storms
    rand(10)
  end

  def weather_report
    return "stormy" if chance_of_storms >= 7
    
    return "sunny"
  end
end
