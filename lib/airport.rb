# Simple TDD with only Airport class. Plane class and plane spec not completed

#I would like a default airport capacity that can be overridden as appropriate
CAPACITY = 5 # Capacity for 5 planes can be changed instead of writing the number everywhere

class Airport
  #I want to instruct a plane to land at an airport
  def land_plane
    return "Plane landed"
  end

  #I want to instruct a plane to take off 
  #from an airport and confirm that it is no longer in the airport
  def takeoff
    return "Plane no longer in airport"
  end

  #I want to prevent landing when the airport is full
  def full? 
      if CAPACITY == 5
        return "Airport full"
      end 
  end 

  #I want to prevent takeoff when weather is stormy 
  def weather 
    stormy = true 
    if stormy == true 
      return "Stop takeoff"
    end 
  end

  #I want to prevent landing when weather is stormy 
  def prevent_landing 
    stormy = true 
    if stormy == true 
      return "Prevent landing"
    end 
  end 
end 
  




