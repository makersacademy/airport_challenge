class Airport

attr_reader :planes,:capacity, :weather

DEFAULT_CAPACITY = 20
DEFAULT_WEATHER = :sunny
CHANCE_OF_STORM = 0.20

  def initialize (capacity = DEFAULT_CAPACITY, weather = DEFAULT_WEATHER)
    @planes = []
    @capacity = capacity
    @weather = weather
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
    :stormy if Random::rand(1.0) < CHANCE_OF_STORM
    :sunny
  end

end
