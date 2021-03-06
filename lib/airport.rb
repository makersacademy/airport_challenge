class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :gates

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @safe_to_land = false
    @safe_to_takeoff = false
    @gates = []
    local_weather(weather_forecast)
  end

  def takeoff(plane)
    if safe_to_takeoff?
      @gates -= [plane]
    end
  end

  def land(plane)
    if safe_to_land?
      @gates << plane
      :success
    end
    
  end

  def safe_to_land?
    if gates.count == capacity
      @safe_to_land = false
    end
    @safe_to_land
  end

  def safe_to_takeoff?
    @safe_to_takeoff
  end

  def local_weather(weather)
    if weather == :stormy
      @safe_to_land = false
      @safe_to_takeoff = false
      :stormy
    else
      @safe_to_land = true
      @safe_to_takeoff = true
      :clear
    end
  end

  def weather_forecast
    forecast = rand(1..30)
    if forecast > 25
      :stormy
    else
      :clear
    end
  end
end
