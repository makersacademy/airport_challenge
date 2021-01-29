class Airport
  attr_accessor :capacity, :planes, :weather
  def initialize
    @capacity = 0
    @planes = []
    @weather = ["sunny", "sunny", "cloudy", "stormy", "sunny"].sample
  end

  def land(flight_number)
    if @planes.length >= @capacity
      return "the airport is full"
    elsif @weather == "stormy"
      return "you can not land due to stormy weather"
    else
    @planes << flight_number
  end
end

  def take_off(flight_number)
    if @weather == "stormy"
      return "you can not take off due to bad weather"
    end
    @planes.delete(flight_number)
  end

  def max_capacity(num)
    @capacity =+ num
  end
end
