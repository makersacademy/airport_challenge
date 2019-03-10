class Airport
  attr_accessor :runway

  def initialize(default_capacity = 10)
    @runway = []
    @capacity = default_capacity
  end

  def land(plane, weather)
    @plane = plane
    if @runway.length >= @capacity
      return "Airport is full"
    else
      weather == "Stormy" ? 'No landing allowed in stormy weather' : @runway << @plane
    end
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
