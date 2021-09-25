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
    elsif storm_check == false # This is error line. Fix method
      @@flight_status -= 1 
      return "The plane has landed."
    else 
      return "Too stormy for this plane to land."
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
