class Airport
  attr_reader :weather

  def initialize
    return @weather = "stormy" if Random.rand > 0.9
    @weather = "sunny"
  end

  private
  attr_writer :weather

end
