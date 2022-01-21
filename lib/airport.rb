class Airport

  def initialize(capacity = 3, weather)
    @capacity = capacity
    @current = 0
    @weather = weather
  end
  
  def land
    if @capacity > @current && @weather != "stormy"
      @current += 1
      return "good for landing!"
    else
      return "no landing for now!"
    end
  end

  def take_off
    if @current > 0 && @weather != "stormy"
      @current -= 1
      return "took off! no longer in the airport"
    else
      return "cannot take-off"
    end
  end

  
end
