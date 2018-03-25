class Airport

  DEFAULT_CAPACITY = 30
  
  attr_accessor :capacity, :planes

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def accept_plane plane
    raise "No landing- stormy weather!" if stormy?
    @planes << plane
  end

  def release_plane plane
    raise 'Plane not found!' if !plane_here? plane
    raise "No taking off- stormy weather!" if stormy?
    @planes.delete plane
  end

  private
  def stormy?
    rand(2) == 1
  end

  def plane_here? plane
    @planes.include? plane
  end
end
