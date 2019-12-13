class Airport

  attr_reader :landed_planes

  def initialize(capacity = 20)
    @landed_planes = []
    @max_capacity = capacity
  end

  def land(plane)
    if full? == true
      raise("Landing not possible, the airport is at full capacity.")
    else
      @landed_planes.push(plane)
    end
  end

  def take_off(plane)
    if check_weather == "stormy"
      raise("Take off not possible due to stormy weather.")
    else
      @landed_planes.delete(plane)
    end
  end

  def check_weather
    weather_options = ["sunny", "stormy"]
    return weather_options.sample
  end

private

  def full?
    if @landed_planes.count >= @max_capacity
      return true
    else
      return false
    end
  end
end
