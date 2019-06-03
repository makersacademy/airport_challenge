require_relative 'planes'
require_relative 'weather'

class Airport
  
#  include WeatherCondition
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(planes)
    raise 'Airport is full' if full?
    raise 'Delayed due to bad weather' if stormy? 
    raise 'Plane has already landed' if apron(planes)
    
    @planes << planes
  end

  def take_off(planes)
    raise 'Delayed due to bad weather' if stormy?
    raise 'Plane is not in this airport' unless apron(planes)

    @planes.pop
  end 

  private 

  def full?
    @planes.length >= capacity
  end

  def apron(planes)
    @planes.include?(planes)
  end

  def stormy?
    @weather.stormy?
  end
end
