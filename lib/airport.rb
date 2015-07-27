class Airport
DEFAULT_CAPACITY = 25
PERCENTAGE_OF_DAYS_STORMY = 3
# I appreciate that the above might not
# strictly return 3% stormy, but close
# enough for jazz
  attr_reader :capacity
# attr_reader :weather

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
    @weather = self.weather
  end

  def land(plane)
    if at_capacity? && bad_weather?
      fail "There's no room here and it's too dangerous to land!"
    end
    if bad_weather? && !at_capacity?
      fail 'It\'s too dangerous to land!'
    end
    if at_capacity? && good_weather?
      fail 'There\'s no room here'
    end

    @hanger << plane
  end

  def bad_weather?
    @weather == :stormy
  end

  def good_weather?
    @weather == :sunny
  end

  def at_capacity?
    @hanger.length >= capacity
  end

  def launch(plane)
    if @hanger.include?(plane) == false
      fail 'That plane is n\'t here'
    elsif bad_weather?
      fail 'It\'s too dangerous to launch!'
    else
      @hanger.delete(plane)
    end
  end

  def weather
    weather_god = rand(100)
    if weather_god <= PERCENTAGE_OF_DAYS_STORMY
      @weather = :stormy
    else @weather = :sunny
    end
  end

end
