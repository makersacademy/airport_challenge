require 'airport'
require 'weather_gen'

class Plane
  
  def initialize(weather)
    @weather = weather
    @at_airport = nil
  end

  def instruct_plane_to_land(airport)
    clear_to_land?(airport)
    # if no errors raised, land plane
    airport.add_plane(self)
    @at_airport = airport # overrides the variable with the airport instance object
    "Plane landed at airport"
  end

  def instruct_plane_to_takeoff
    clear_to_takeoff?
    # if no errors raised, plane takes off
    @at_airport.remove_plane(self)
    @at_airport = nil # sets it back to nil signalling the plane is not at an airport
    "Plane has taken off"
  end

  # if variable not assigned then the plane is not at an airport
  def at_airport?
    !@at_airport.nil?
  end

  private

  # method raises error if the plane is not clear to land at the given airport
  def clear_to_land?(airport)
    raise_error("This plane is already in an airport, " + 
      "instruct the plane to takeoff before instructing it to land") if at_airport?
    raise_error("This airport is full, this plane cannot land") if airport.full?
    raise_error("The weather is stormy, this plane cannot land") if @weather.forecast_stormy?
  end

  # method raises error if the plane is not clear to takeoff
  def clear_to_takeoff?
    raise_error("This plane is not at an airport, " + 
      "land it at an airport before instructing it to takeoff") unless at_airport?
    raise_error("The weather is stormy, this plane cannot takeoff") if @weather.forecast_stormy?
  end
  
  def raise_error(error)
    raise error
  end

end
