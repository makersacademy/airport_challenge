require './lib/weather_check.rb'

class Plane
  attr_reader :status #Call status to confirm that it has landed.

  def initialize
    @status = "Flying"
  end

  def land(airport)
    if @status == "Flying"
       @status = airport
     else
      raise "Plane cannot land."
     end
   end

  def takeoff(airport)
    if @status == airport
      @status = "Flying"
    else
      raise "Cannot takeoff if not at correct airport."
    end
  end
end

#planes that are already flying cannot takes off and/or be in an airport;
