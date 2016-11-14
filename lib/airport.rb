require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    # if @planes.include?(plane) #|| plane.flying == false
    #   raise 'This plane has already landed'
    # else
      raise 'Cannot land plane: airport is full' if full?
      too_stormy
      #plane.flying = false
      @planes << plane
    #end
  end

  def take_off(plane)
    too_stormy
    raise 'Plane not available for take off' if !(@planes.include?(plane))
      @planes.delete(plane)
      #plane.flying = true
      plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def too_stormy
    raise 'weather is too stormy' if @weather.stormy? == true
  end

end
