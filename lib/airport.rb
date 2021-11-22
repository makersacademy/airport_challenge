# For Peer: if you open this in IRB, you also have to require weather and plane file
#e.g. do irb -r ./lib/airport ./lib/plane ./lib/weather

class Airport

  attr_reader :plane_list, :capacity

  DEFAULT_CAPACITY = 50

  def initialize
    @plane_list = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'this airport is full' if full?
    fail 'Dangerous Weather' if get_weather == 'stormy'
    @plane_list << plane
  end

  def take_off(_plane)
    fail 'Dangerous Weather' if get_weather == 'stormy'
    # Confirm No longer in airport
    plane_list.pop
  end

  private

  def full?
    if @capacity >= DEFAULT_CAPACITY
    end
  end

  def get_weather 
    Weather.new.generate_weather
  end

end
