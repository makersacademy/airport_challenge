class Airport

  attr_reader :planes, :weather

  def initialize(weather)
    @planes = []
    @weather = weather
  end

  def request_to_land(plane)
    if @weather.sunny?
      @planes << plane
      true
    else
      false
    end
  end

  def request_take_off(plane)
    if @weather.sunny?
      @planes.delete(plane)
      true
    else
      false
    end
  end

end
