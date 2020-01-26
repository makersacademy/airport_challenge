class Airport

  attr_reader :capacity, :num_of_planes

  def initialize(capacity = 10)
    self.capacity = capacity
    self.num_of_planes = 0
  end

  def add_plane
    self.num_of_planes += 1
  end

  private
  attr_writer :capacity, :num_of_planes
  
end
