class Airport
  attr_reader :weather, :full

  def initialize
    @full = false
    return @weather = "stormy" if Random.rand > 0.9
    @weather = "sunny"
  end

  def full?
    @full
  end

  private
  attr_writer :weather, :full

end
