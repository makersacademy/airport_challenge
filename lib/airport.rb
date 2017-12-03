class Airport

  def initialize
    @planes = []
    @max_capacity = 3
  end

  def add_plane(plane)
    if full?
      'Airport is full'
    else
      @planes << plane unless full?
      'Plane is landed'
    end
  end

  def remove_plane
    @planes.shift
    'Plane has left airport'
  end

  def empty?
    @planes.empty?
  end

  def change_max_capacity(max_capacity)
    @max_capacity = max_capacity
  end

  private

  def full?
    @planes.length == @max_capacity
  end
end
