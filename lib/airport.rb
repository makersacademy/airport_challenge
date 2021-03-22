class Airport

  attr_accessor :capacity
  attr_reader :planes

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
    return true if @planes.include?(plane)
    false
  end

  def take_off(plane)
    return true if @plane == nil
  end

  def prevent_landing(plane)
    raise "planes cannot land when airport is full" if @planes.count >= @capacity
  end
end
  # def prevent_take_off(plane)
  #   if @weather == @stormy
  #     raise "planes cannot take off when weather is stormy"
  #   end
  # end

 #  use private method - can not call outside class
 #
 #  def stormy?
 #   p rand(1..7) > 4
 # end
