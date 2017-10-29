class Airport
  attr_reader :capacity, :number_of_planes

  DEFAULT_CAPACITY = 20

  def initialize(default = DEFAULT_CAPACITY)
    @capacity = default
    @number_of_planes = 0
  end

  def add_plane
    @number_of_planes += 1
  end

end
