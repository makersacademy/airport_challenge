class Airport
  attr_accessor :runway

  def initialize 
    @runway = []
  end

  def land(plane,weather)
    @plane = plane
    weather == "Stormy" ? 'No landing allowed in stormy weather' : @runway << @plane
  end

  def takeoff(plane, weather)
    @plane = plane
    if weather == "Stormy"
      return 'No take off allowed in stormy weather'
    elsif weather == "Sunny"
      @runway != [] ? @runway.take(@runway.length - 1) : nil
    end
  end
  
end

