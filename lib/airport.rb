require_relative 'plane'

class Airport

attr_reader :holding_bay, :weather

  def initialize
    @holding_bay = []
    @weather = weather
  end

  def land(plane)
    plane.change_status
    @holding_bay << plane
  end

  def take_off
    plane = @holding_bay.pop
    plane.change_status
    plane
  end


  def weather_generator

  end

#   def setup_holding_bay(capacity)
#     @holding_bay =
#   end

end
