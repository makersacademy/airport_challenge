class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity 
  end

  def instruct_to_land(plane)
    fail 'Airport is full' if airport_full?
    plane.land
    @planes << plane
    plane
  end

  def instruct_to_take_off(plane)
    plane.take_off
    @planes.delete(plane)
    plane
  end

  private 

  def airport_full?
    @planes.count >= capacity
  end

  def already_landed?
    @planes.include? plane
  end

  def weather
    ["stormy", "sunny"].sample
  end

  def stormy?
    weather == "stormy" ? true : false
  end


end
