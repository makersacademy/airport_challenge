class Plane
  def initialise(flying_or_not)
    @flight_status = flying_or_not
  end
    
  def flying?
    return "#{@flightstatus}"
  end

  def land
    if @flight_status == "flying"
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
