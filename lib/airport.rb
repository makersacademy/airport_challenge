class Airport

  attr_accessor :capacity, :stormy

  def initialize(capacity = 20)
    @capacity = capacity
    @planes = []
    @stormy = false 
  end

  def land_plane(plane)
    raise 'Landing: no airport space' if full?
    raise 'Landing: to stormy to land' if stormy?
    @planes.push(plane)
  end

  def take_off
    raise 'Taking: to stormy to take off' if stormy?
  end

  def report_storm
    @stormy = true
  end 

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @stomry 
  end
end
