class Airport

  def initialize(capacity = 10)
    @capacity = capacity
    @planesatairport = []
  end

  def addtraffic(plane)
    raise "Cant land; NO capacity" unless @planesatairport.length < @capacity
    @planesatairport << plane
    true
  end

  def reducetraffic(plane)
    @planesatairport.delete(plane)
    true
  end

end
