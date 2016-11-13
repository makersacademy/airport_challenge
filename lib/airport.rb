require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 20

  @current_weather

  attr_reader :planes, :current_weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if @planes.include?(plane)
      raise 'This plane has already landed'
    else
      at_capacity
      if @current_weather == "stormy"
        too_stormy
      else
        @planes << plane
      end
    end
  end

  def take_off(plane)
    raise 'Plane not available for take off' if !(@planes.include?(plane))
    if @current_weather == "stormy"
      too_stormy
    else
      @planes.delete(plane)
      plane
    end
  end

  def too_stormy
    raise 'weather is too stormy'
  end

  def at_capacity
    if full?
      raise 'Airport is full'
    end
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
