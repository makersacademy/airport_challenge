class Plane
  def initialise(flying_or_grounded)
    @flight_status = flying_or_grounded
  end
    
  def flying
    return @flight_status.to_s
  end

  def land
    today_weather.storm
    if today_weather == "storm"
      return "Too stormy to land."
    elsif @flight_status == "flying" 
      @flight_status = "grounded"
      return "The plane has landed."
    else 
      return "This plane is already grounded."
    end
  end

  def take_off
    if @flight_status == "grounded"
      @flight_status = "flying"
      return "The plane takes off."
    else 
      return "This plane is already flying."
    end
  end
end
