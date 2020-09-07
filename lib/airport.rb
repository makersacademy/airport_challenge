class Airport
  attr_reader :capacity, :hangar

  def initialize(capacity = 5, hangar = [])
    @capacity = capacity
    @hangar = hangar
  end

  def store_plane(plane)
    @hangar << plane
  end
  
  def full?
    @hangar.count >= capacity
  end

  def empty?
    @hangar.empty?
  end

end