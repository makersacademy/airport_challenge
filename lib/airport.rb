
class Airport

  attr_reader :all_planes

  DEFAULT_CAPACITY = 35
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @all_planes = []
  end

  def can_land_a_plane(flight)
    @all_planes.push(flight)
  end

  def can_take_off(flight)
    @all_planes.delete(flight)
  end

  def full_airport(capacity)
     if @capacity == @all_planes.size
     puts 'airport is full now, cannot land any planes'
     end
  end
end