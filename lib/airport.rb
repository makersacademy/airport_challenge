require_relative 'plane'

class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end 

	def land_plane(plane)
    @hangar << plane
  end 

  def take_off(plane)
    fail "Weather is too stormy to take_off" if @weather == "stormy weather"
    @hangar.pop
  end 

  def weather(conditions = rand(2))
    case conditions 
      when 0
        @weather = "Good weather"
      when 1 
        @weather = "stormy weather"
    end 
  end 
end
