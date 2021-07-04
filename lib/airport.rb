require_relative 'plane'

class Airport 

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @amount_of_planes_landed =0
    @planes =[]
  end

  def land(plane)
    raise 'airport is full' if full?
    raise 'cannot land plane, weather stormy' if stormy?
    @planes << plane 
  end

  def take_off(plane)
    raise 'cannot take off plane, weather stormy' if stormy?
  end

  private
  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..8) > 4
  end

end

