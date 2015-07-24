class Airport
DEFAULT_CAPACITY = 25
attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
    @weather
  end

  def land(plane)
    if @hanger.length < @capacity
      @hanger << plane
    else fail 'There\'s no room here'
    end
  end

  def launch(plane)
      if @hanger.include?(plane)
        @hanger.delete(plane)
      else fail 'That plane isn\'t here'
      end
  end

  def space_check
    @capacity - @hanger.length
  end

  def weather
    weather_god = rand(100)
    if weather_god < 3
      @weather = :stormy
    else @weather = :sunny
    end 
  end

end
