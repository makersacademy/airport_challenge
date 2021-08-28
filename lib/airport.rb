class Airport

  
  def initialize
    @planes = []
    @hanger_capacity = 1
  end

  attr_reader :planes 
  attr_accessor :hanger_capacity

  def land_plane(plane)
    airport_full? ? (raise "Airport Full") : @planes << plane
    record_landing(plane)
  end

  def take_off
    record_departure
    Plane.new true
  end

  private

  def record_departure
    @planes.delete_at(@planes.length - 1)
  end

  def record_landing(plane)
    plane.flying = false
  end

  def airport_full?
    @planes.length >= @hanger_capacity
  end

end
