# require "plane"

class Airport
  attr_accessor :runway

  def initialize 
    @runway = []
  end

  def instructions(instruction,plane)
    # plane = Plane.new
     @plane = plane
    if instruction == 'land' 
      @runway << @plane
    elsif instruction == 'takeoff'
      #l = @runway.length
      if @runway != []
        @runway.take(@runway.length - 1)
      end
    end
  end 

end
