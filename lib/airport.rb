require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hanger, :capacity, :weather
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = weather_report
  end

  def land(plane)
    fail 'the weather is stormy, cannot land' if weather == 'stormy'
    fail 'hanger already full' if  self.full?
      hanger.push(plane)
  end

  def take_off(plane)
    fail 'the weather is stormy, cannot take off' if weather == 'stormy'
    hanger.delete(plane)
  end 

  def full?
    hanger.count >= capacity
  end

  def weather_report
    random_num = Random.new
    weather = random_num.rand(9)
    if weather > 7
      'stormy'
    else
      'sunny'
    end
  end
end
