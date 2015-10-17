class AirPort
  DEFAULT_CAPACITY = 10
  def initialize
    @planes = []

  def land_safely(planes)
    fail 'airport is full' if @planes.count >= DEFAULT_CAPACITY
    @planes << planes
   end
  end

  def take_off_safely
    Plane.new
  end

end
