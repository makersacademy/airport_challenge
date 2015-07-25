class Airport
DEFAULT_CAPACITY = 25
PERCENTAGE_OF_DAYS_STORMY = 3
# I appreciate that the above might not
# strictly return 3% stormy, but close
# enough for jazz
attr_reader :capacity
#attr_reader :weather


  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
    @weather = self.weather
  end

  def land(plane)
    if @hanger.length >= @capacity && @weather == :stormy
       fail 'There\'s no room here and it\'s too dangerous to land!'
    elsif @weather == :stormy && @weather == :sunny
       fail 'It\'s too dangerous to land!'
    elsif @hanger.length >= @capacity
       fail 'There\'s no room here'
    else @hanger << plane
    end
  end

  def launch(plane)
    if @hanger.include?(plane) == false
      fail 'That plane isn\'t here'
    elsif @weather == :stormy
      fail 'It\'s too dangerous to launch!'
    else @hanger.delete(plane)
    end
  end

  def space_check
    @capacity - @hanger.length
  end

  def weather
    weather_god = rand(100)
    if weather_god <= PERCENTAGE_OF_DAYS_STORMY
      @weather = :stormy
    else @weather = :sunny
    end
  end

end
