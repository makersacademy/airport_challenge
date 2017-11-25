class Airport

  def initialize
    @planes = []
  end

  def add_plane(plane)
    if full?
      'Airport is full'
    else
      @planes << plane unless full?
      'Plane is landed'
    end
  end

  private

  def full?
    max_capacity = 3
    @planes.length == max_capacity
  end
end
