class Plane
  attr_accessor :grounded, :air

  def initialize
    @location = :grounded
  end

  def where_is_it?
    @location == :grounded
  end
  

  def ground?
    @location = :grounded
  end

  def flying?
    @location = :air
  end
end
