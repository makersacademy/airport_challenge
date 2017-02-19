class Airport

  attr_reader :planes, :weather, :capacity

  def initialize(weather, capacity = 10)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def request_to_land(plane)
    conditions = @weather.sunny?
    puts "The airport can't accept the plane because it's full!" if full?
    puts "The weather conditions are not suitable for landing!" if conditions == false
    if conditions && !full?
      @planes << plane
      true
    else
      false
    end
  end

  def full?
    @planes.count >= @capacity
  end

  def request_take_off(plane)
    if @weather.sunny?
      @planes.delete(plane)
      true
    else
      puts "The weather conditions are not suitable for take off!"
      false
    end
  end

end
