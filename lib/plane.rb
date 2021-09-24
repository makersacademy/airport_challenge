require_relative "weather"

class Plane
  def initialise(flying_or_grounded)
    @@flight_status = flying_or_grounded
  end
    
  def flying
    if @@flight_status == 1
      return "flying"
    else 
      return "grounded"
    end
  end

  def land
    if @@flight_status == 0
        return "This plane is already grounded."
    elsif @@flight_status == 1 && storm_check == 0
        return "This plane cannot land during the storm."
    else 
        @@flight_status =- 1
        return "The plane has landed."
    end
  end

  def take_off
    if @@flight_status == 0
      @@flight_status += 1
      return "The plane takes off."
    else 
      return "This plane is already flying."
    end
  end
end
