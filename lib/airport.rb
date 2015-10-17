class AirPort
  def initialize
    @planes = []

  def land_safely(planes)
    fail 'airport is full' if @planes.count >= 10
    @planes << planes
   end
  end

  def take_off_safely
    Plane.new
  end

end
