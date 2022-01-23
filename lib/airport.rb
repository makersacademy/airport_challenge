class Airport

  def initialize(capacity = 3, weather = "sunny")
    @capacity = capacity
    @current = 0
    @weather = weather
  end

  def add_flight
    @current += 1
  end

  def remove_flight
    if @current > 0 
      @current -= 1 
    else
      raise "no flight to be removed"
    end
  end

  def get_capacity
    @capacity
  end

  def get_current
    @current
  end

  def get_weather
    @weather
  end

end
