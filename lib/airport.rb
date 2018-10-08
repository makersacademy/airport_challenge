require './lib/airtraffic'
require './lib/plane'

class Airport
  attr_reader :at_control

  def initialize
    @capacity = 20
    @at_control = Airtraffic.new
    @spaces = Array.new
  end

  def full?
    @spaces.length == @capacity
  end
  
  def instruct_take_off(terminal_no)
    if @at_control.safe_conditions
      @at_control.clear_for_take_off(@spaces[terminal_no - 1])
      if @at_control.safely_in_flight(@spaces[terminal_no - 1])
        @spaces.delete(@spaces[terminal_no - 1])
        "Confirmed safe take off, airport is area is now clear"
      end
    else
      "Conditions are not safe, Not clear for take off"
    end
  end
  
  def land_plane(plane)
    if @at_control.safe_conditions and !full?
      if plane.coming_in_to_land
        @spaces.push(plane)
        "You're safe to land flight"
      end
    else
      "Conditions are not safe for a landing pilot"
    end
  end
end
