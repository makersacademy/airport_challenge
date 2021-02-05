class Airport

  MAX_CAPACITY = 5
  
  attr_accessor :capacity, :planes, :weather
  def initialize(capacity = MAX_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = ["sunny", "sunny", "cloudy", "stormy", "sunny"].sample
  end

  def land(flight_number)
    if @planes.length >= @capacity && @weather == "stormy"
      return "airport is full and the weather is poor, you must not land"
    elsif @planes.length >= @capacity
        return "the airports max capacity of #{@capacity} planes has been reached, the airport is full"
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

  def override_capacity(num)
    @capacity = num
  end
end
