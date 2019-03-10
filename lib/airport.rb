class Airport
  attr_accessor :runway

  def initialize 
    @runway = []
  end

  def land(plane)
    @plane = plane
    @runway << @plane
  end

  def takeoff(plane, weather)
    @plane = plane
    if weather == "Stormy"
      return 'No take off allowed in stormy weather'
    end

    if @runway != []
      @runway.take(@runway.length - 1)
    end
  end

end
  # def instructions(instruction,plane,weather)
  #   @plane = plane
  #   if instruction == 'land' 
  #     @runway << @plane
  #   elsif instruction == 'takeoff'
  #     if @runway != []
  #       @runway.take(@runway.length - 1)
  #     end
  #   end
