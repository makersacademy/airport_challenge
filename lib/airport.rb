class Airport
  attr_reader :name, :list_of_planes, :capacity
  attr_writer :name, :list_of_planes, :capacity

  def initialize(name, list_of_planes = [], capacity = 4)
    @name = name
    @list_of_planes = list_of_planes
    @capacity = capacity
  end

  def include_plane?(plane)
    @list_of_planes.include?(plane)
  end
end
