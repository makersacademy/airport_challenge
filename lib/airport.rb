class Airport

  def initialize(capacity = 0)
    @capacity = capacity
    @planesatairport = []
  end

  def addtraffic(plane)
    @planesatairport << plane
    true
  end

  def reducetraffic(plane)
    @planesatairport.delete(plane)
    true
  end

end
