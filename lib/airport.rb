class Airport
  attr_reader :capacity, :number_of_planes

  def initialize
    @capacity = 20
    @number_of_planes = 0
  end

  def add_plane
    @number_of_planes += 1
  end

end
