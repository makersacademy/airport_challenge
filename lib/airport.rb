require_relative 'planes'
require_relative 'weather'

class Airport
  
  include WeatherCondition
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(planes)
    raise 'Airport is full' if full?
    raise 'Weather is stormy, landing is not permitted' if stormy?
    raise 'Plane has already landed' if apron(planes)
    
    @planes << planes
  end

  def take_off(planes)
    raise 'Weather is stormy, take-off is not permitted' if stormy?
    raise 'Plane is not in this airport' unless apron(planes)

    @planes.pop
  end 

  private

  def full?
    @planes.count >= capacity
  end

  def apron(planes)
    @planes.include?(planes)
  end

  def stormy?
    weather = WeatherCondition::Weather.new
    weather.stormy
  end
end
