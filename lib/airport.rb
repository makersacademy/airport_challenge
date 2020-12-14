require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :hangar, :capacity
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'Airport is full' if full?
    # raise 'Weather is stormy, do not land!' if @weather.stormy_weather?
    @hangar << plane
  end

  def take_off(plane)
    # raise 'Weather is stormy, do not takeoff!' if @weather.stormy_weather?
    if @weather.stormy_weather? == true
      raise 'Weather is stormy, do not takeoff!'
    end
    
    @hangar.delete(plane)
  
  end

  private
  def full?
    return @hangar.length >= @capacity
  end
end
