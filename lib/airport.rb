class Airport

  attr_accessor :weather

  def initialize
    return @weather = "stormy" if Random.rand > 0.9
    @weather = "sunny"
  end
end
