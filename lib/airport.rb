class Airport

  attr_reader :hangar
  DEFDAULT_HANGAR_SIZE = 20

  def initialize(capacity = DEFDAULT_HANGAR_SIZE)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Stormy, cannot land" if stormy?
    raise "Airport is full" if full?
    raise "Plane has already landed" unless plane.flying
    plane.flying = false
    @hangar.push(plane)
  end

  def takeoff
    raise "Stormy, cannot takeoff" if stormy?
    plane = @hangar.pop
    raise "Plane is already flying" if plane.flying
    plane.flying = true
    return plane
  end


  def stormy?
    weather_chance = rand(1..50)
    return @stromy = true if weather_chance == 50
    @stormy = false
  end


  private

  def full?
    hangar.length >= @capacity
  end

end
