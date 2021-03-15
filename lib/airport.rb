class Airport
  def land_plane(plane)
    @plane = plane
  end

  def plane_landed?(plane)
    if @plane == nil
      return false

    else
      return true
    end
  end

  def take_off(plane)
    if @plane == nil
      return true
    end
  end

  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def prevent_landing(plane)
    raise "plane cannot land when airport is full"
    if @planes.count >= @capacity
      @planes << plane
    end
  end

  def plane_count
    @planes.plane_count
  end
end
