class Airport

attr_accessor :planes , :capacity


  def initialize(capacity = 30)
    @planes = []
    @capacity = capacity
  end


  def land(plane, weather = "sunny")
    @weather = weather
    if @weather == "stormy"
      "Plane not able to land due to storm"
    elsif @full == true
      "Airport is full"
    else
      "#{plane} landed"
    end
  end

  def take_off(plane, weather = "sunny")
    @weather = weather
    if @weather == "stormy"
      "Plane can not take off due to stormy weather"
    else
    "#{plane} has taken off"
    end
  end

  def full?(response)
    @full = response
  end


end
