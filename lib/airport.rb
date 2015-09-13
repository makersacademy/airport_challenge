class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity 
  end

  def make_land(plane)
    fail 'Plane has already landed' if @planes.include? plane
    fail 'Airport is full' if airport_full?
    fail 'The weather is too stormy' if stormy?
    plane.land
    @planes << plane
    plane
  end

  def make_take_off(plane)
    fail 'Plane has already taken off' if plane.flying?
    fail 'The weather is too stormy' if stormy?
    plane.take_off
    @planes.delete(plane)
    plane
  end

  private 

  attr_writer :capacity

  def airport_full?
    @planes.count >= capacity
  end

  def weather
    [:stormy, :sunny].sample 
  end

  def stormy?
    weather == :stormy ? true : false
  end


end
