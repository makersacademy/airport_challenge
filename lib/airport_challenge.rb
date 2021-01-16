require_relative "plane"
require_relative 'weather'

class Airport
  DEF_CAPACITY = 20
  @landed_planes = []
  @fly = []
  self.class.public_send(:attr_reader, :landed_planes, :fly)

  attr_reader :capacity, :fly, :stormy, :weather, :landed, :planes

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    landing_safety_check(plane)
    planes << plane
    self.class.landed_planes << plane
  end

  def landing_safety_check(plane)
    storm_safety
    plane_landed(plane)
    full_airport
  end

  def storm_safety
    raise "Too stormy." if weather.stormy?
  end

  def plane_landed(plane)
    raise "Plane grounded elsewhere." if landed?(plane)
  end

  def full_airport
    raise "This airport is full." if full?
  end

  def takeoff(plane)
    takeoff_safety_check(plane)
    self.class.landed_planes.delete(plane)
    planes.delete(plane)
    self.class.fly << plane
  end

  def takeoff_safety_check(plane)
    storm_safety
    fly_safety(plane)
    absent_plane(plane)
  end

  def fly_safety(plane)
    raise "Plane in air." if flying?(plane)
  end

  def absent_plane(plane)
    raise "Plane not in airport." if absent?(plane)
  end

  private
  attr_writer :planes

  def full?
    planes.length == capacity
  end

  def absent?(plane)
    !planes.include?(plane)
  end

  def flying?(plane)
    self.class.fly.include?(plane)
  end

  def landed?(plane)
    self.class.landed_planes.include?(plane)
  end
end
