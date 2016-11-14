require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather, :current_weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    if @planes.include?(plane) || plane.status == 'landed'
      raise 'This plane has already landed'
    else
      raise 'Airport is full' if full?
      too_stormy if @weather.current_weather == 'stormy'
      plane.status = 'landed'
      @planes << plane
    end
  end

  def take_off(plane)
    too_stormy if @weather.current_weather == 'stormy'
    raise 'Plane not available for take off' if !(@planes.include?(plane))
      @planes.delete(plane)
      plane.status = 'flying'
      plane
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def too_stormy
    raise 'weather is too stormy'
  end

end
