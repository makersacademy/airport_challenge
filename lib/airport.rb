class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :name, :capacity
  def initialize name, capacity = DEFAULT_CAPACITY
    @name = name
    @planes = []
    @capacity = capacity
  end

  def count
    check_planes
    @planes.size
  end

  def accept plane
    return false if @planes.size >= @capacity

    @planes << plane
    true
  end

  private

  def check_planes
    @planes.delete_if { |plane| plane.flying? }
  end
end
