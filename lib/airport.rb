class Airport

  attr_accessor :planes, :capacity, :stormy

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    # @weather = weather
    # @stormy = stormy
  end

  def land_plane(plane)
    if capacity == @planes.length
      raise "airport capacity full"
    end

    @planes << plane
  end

  def plane_landed?(plane)
    if @planes.include?(plane)
      return true
    else
      return false
    end
  end

  def take_off(plane)
    return true if @plane == nil
  end

  def prevent_landing(plane)
    raise "planes cannot land when airport is full"
    if @planes.count >= @capacity
    end
  end
end
  # def prevent_take_off(plane)
  #   if @weather == @stormy
  #     raise "planes cannot take off when weather is stormy"
  #   end
  # end
