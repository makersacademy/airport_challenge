require 'airport'
require 'weather_gen'

class Plane
  def initialize(weather)
    @weather = weather
    @at_aiport = nil
  end

  def instruct_plane_to_land(airport)
    if self.at_aiport?
      raise "This plane is already in an airport, instruct the plane to takeoff before instructing it to land"
    elsif airport.full?
      raise "This airport is full, this plane cannot land"
    elsif @weather.forecast_stormy?
      raise "The weather is stormy, this plane cannot land"
    else
      airport.add_plane(self)
      @at_aiport = airport
      "Plane landed at airport"
    end
  end

  def instruct_plane_to_takeoff
    if !at_aiport?
      raise "This plane is not at an airport, land it at an airport before instructing it to takeoff"
    elsif @weather.forecast_stormy?
      raise "The weather is stormy, this plane cannot takeoff"
    else 
      @at_aiport.remove_plane(self)
      @at_aiport = nil
      "Plane has taken off"
    end
  end

  # if variable not assigned then the plane is not at an airport
  def at_aiport?
    !@at_aiport.nil?
  end
end