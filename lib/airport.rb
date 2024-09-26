require 'plane.rb'
require 'weather.rb'

class Airport

  attr_reader :hangar

  def initialize(hangar_cap = 2)
    @hangar = []
    @hangar_cap = hangar_cap
  end

  def land_plane(plane, weather)
    raise "No space in hangar" unless @hangar.length < @hangar_cap
    raise "You can't land plane" unless weather == "sunny"
    
    @hangar << plane unless @hangar.include?(plane)
  end

  def take_off(plane, weather)

    raise "You can't take off" unless weather == "sunny"

    @hangar.delete(plane)
    @hangar.empty? ? "No planes in hangar" : "Planes in hangar: #{hangar.length}"
  
  end
end
