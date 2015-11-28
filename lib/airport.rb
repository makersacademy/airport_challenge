class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    planes << plane
    self
  end

  def contain? plane
    planes.include? plane
  end

end
