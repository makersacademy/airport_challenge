require_relative "./plane"

class Airport
  DEFAULT_CAPACITY = 20
  
  attr_reader :capacity
  attr_reader :weather
  def initialize(capacity = DEFAULT_CAPACITY, weather = nil)
    @capacity = capacity
    @hanger = Array.new
    
    if weather == nil
      @weather = random_weather()
    else 
      @weather = weather
    end
  end

  def random_weather
    if rand(10) == 9
      return "stormy"
    end
    return "sunny"
  end
  def weather_set(weather)
    @weather = weather
  end

  def land(plane)
    fail "The hanger is full!" if full_hanger?
    fail "The weather is too rough to land" if stormy?

    @hanger.push(plane)
  end
  
  def takeoff
    fail "The're no planes to take off in the hanger" if empty_hanger?
    fail "The weather is too rough to takeoff" if stormy?

    @hanger.pop()
  end

  def empty_hanger?
    return @hanger.empty?
  end

  def full_hanger?
    return @hanger.length == @capacity
  end

  def stormy?
    return @weather == "stormy"
  end

end
