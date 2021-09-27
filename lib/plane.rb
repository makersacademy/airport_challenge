require 'airport'
require 'weather_gen'

class Plane
  
  def initialize(weather)
    @weather = weather
  end

  def instruct_plane_to_land(airport)
    clear_to_land?(airport) # will check for and raise errors if found
    # if no errors raised, land plane
    airport.add_plane(self)
    @at_airport = airport # overrides the variable with the airport instance object
    "Plane landed at airport"
  end

  def instruct_plane_to_takeoff
    clear_to_takeoff? # will check for and raise errors if found
    # if no errors raised, plane takes off
    @at_airport.remove_plane(self)
    @at_airport = nil # sets it back to nil signalling the plane is not at an airport
    "Plane has taken off"
  end

  # if variable not assigned then the plane is not at an airport
  def in_air?
    @at_airport.nil?
  end

  private

  # method raises error if the plane is not clear to land at the given airport
  def clear_to_land?(airport)
    raise "This plane is already in an airport, " + 
      "instruct the plane to takeoff before instructing it to land" unless in_air?
    raise "This airport is full, this plane cannot land" if airport.full?
    raise "The weather is stormy, this plane cannot land" if @weather.forecast_stormy?
  end

  # method raises error if the plane is not clear to takeoff
  def clear_to_takeoff?
    raise "This plane is not at an airport, " + 
      "land it at an airport before instructing it to takeoff" if in_air?
    raise "The weather is stormy, this plane cannot takeoff" if @weather.forecast_stormy?
  end

end
