class Airport

attr_reader :planes,:capacity, :weather

DEFAULT_CAPACITY = 20
DEFAULT_WEATHER = :sunny
CHANCE_OF_STORM = 0.35

  def initialize (weather = DEFAULT_WEATHER, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def weather(set)
    @weather = set
  end

  def possible_land?
    weather_check == :sunny
  end
  ###not clear why and works but && doesnt
  ### check with Ben or Sam - the above gives nil if the weather is stormy

  def request_land(plane)
    fail if full?
    plane.ground if possible_land?
    planes<<plane
  end

  def request_take_off(plane)
    fail if empty?
    plane.fly_away if possible_take_off?
    planes.delete(plane)
  end

  def possible_take_off?
    weather_check == :sunny
  end

  def full?
    planes_count >= capacity
  end

  def planes_count
    planes.length
  end


  def empty?
    planes.empty?
  end

  def weather_check
    @weather = :stormy if Random::rand(1.0) < CHANCE_OF_STORM
    @weather
  end

end
