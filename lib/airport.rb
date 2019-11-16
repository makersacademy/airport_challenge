class Airport
  attr_reader :name
  def initialize name
    @name = name
    @planes = []
  end

  def count
    check_planes
    @planes.size
  end

  def accept plane
    @planes << plane
  end

  private

  def check_planes
    @planes.delete_if { |plane| plane.flying? }
  end
end
