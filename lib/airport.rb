class Airport

  DEAFAULT_CAPACITY = 50
  attr_accessor :capacity
  attr_reader :landed_planes

  def initialize(capacity=DEAFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'This plane has already landed!' if plane_exists?(plane)
    fail 'Too many planes at this aiport!' if full?
    check_weather
    @landed_planes << plane
    return "A plane has landed!"
  end

  def take_off(plane=@landed_planes.sample)
    fail 'There are no planes to take off!' if empty?
    fail 'That plane is not at this airport!' unless plane_exists?(plane)
    check_weather
    puts "A plane has taken off!"
    @landed_planes.delete(plane)
  end

  def build_plane #wanted to implement this feature if i had more time
    fail 'Too many planes at this aiport!' if full?
    @landed_planes << Plane.new
  end

  private

  def full?
    @landed_planes.length >= @capacity ? true : false
  end

  def empty?
    @landed_planes.length < 1
  end

  def plane_exists?(plane)
    @landed_planes.include?(plane)
  end

  def check_weather
    fail 'The weather is too stormy right now!' if Weather.stormy?
  end

end
