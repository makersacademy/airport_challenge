class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_accessor :hanger
  attr_accessor :weather

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
    @weather = "sunny"
  end

  def random_weather
    weather = 'stormy' if rand(20) == 1
  end

  def landing_checks plane
    fail 'Cannot land in stormy weather' if weather == "stormy"
    fail 'Airport is full' if hanger.size == capacity
    fail 'Plane already in hanger' if hanger.include?(plane) == true
  end

  def take_off_checks plane
    fail 'Cannot take off in stormy weather' if weather == "stormy"
    fail 'That plane is not in hanger' if hanger.include?(plane) == false
  end

  def instruct_to_take_off plane
    random_weather
    take_off_checks plane
    plane.take_off
    hanger.delete plane
  end

  def instruct_to_land plane
    random_weather
    landing_checks plane
    hanger << plane
    plane.land
  end
end
