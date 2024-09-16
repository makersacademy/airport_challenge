class Airport
  attr_reader :plane_in,:plane_out, :capacity, :plane_count, :planes, :weather
  CAPACITY = 20
  plane_count = 0

  def initialize(*)
    @capacity = CAPACITY
    @planes = []
  end

  def accept_plane(*)
    @plane_in = true
  end

  def release_plane(*)
    @plane_out = true
  end

  def land(plane)
    raise 'Airport is full!' if full?
    @planes << plane
  end

  def plane_setting_off
    raise 'Weather too bad for flying' if stormy?
    @planes.pop
  end

  private

  def stormy?
    rand(2) == 1
  end

  def full?
    @plane_count == @capacity
  end

end
