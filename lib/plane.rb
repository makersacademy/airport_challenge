require_relative "weather"

class Plane
  def initialise(flying_or_grounded)
    @@flight_status = "#{flying_or_grounded}"
  end
    
  def flying
    return @@flight_status
  end

  def land
    storm_check
    puts @@flight_status.to_s
    if @@flight_status == "grounded"
        return "The plane has already landed."
    elsif storm_check == 0
        return "This plane cannot land during the storm."
    else 
        @@flightstatus = "grounded"
        return "The plane has landed."
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
