class Airport

  DEAFAULT_CAPACITY = 50
  attr_accessor :capacity
  attr_reader :landed_planes

  def initialize(capacity=DEAFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Too many planes at this aiport!' if full?
    fail 'This plane has already landed!' if @landed_planes.include?(plane)
    @landed_planes << plane
    return "A plane has landed!"
  end

  def take_off(plane)
    fail 'This plane is not at the airport!' unless @landed_planes.include?(plane)
    @landed_planes.delete(plane)
    return "A plane has taken off!"
  end

  def build_plane
    fail 'Too many planes at this aiport!' if full?
    @landed_planes << Plane.new
  end

  private

  def full?
    @landed_planes.length >= @capacity ? true : false
  end

  # def empty?
  #
  # end
end
