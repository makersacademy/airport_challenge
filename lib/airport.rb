class Airport

  DEFAULT_CAPACITY = 30
  
  attr_accessor :capacity, :planes

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def accept_plane plane
    raise 'Airport full' if full?
    raise "No landing- stormy weather!" if stormy?
    @planes << plane
    true
  end

  def release_plane plane
    raise 'Plane not found!' unless plane_here? plane
    raise "No taking off- stormy weather!" if stormy?
    @planes.delete plane
    true
  end

  def stormy?
    Kernel.rand(2) == 1
  end

  def add_plane plane
    # add newly created plane to an available airport
    raise 'Airport full' if full?
    @planes << plane
    true
  end

  private
  def plane_here? plane
    @planes.include? plane
  end

  def full?
    @planes.size >= @capacity
  end
end
