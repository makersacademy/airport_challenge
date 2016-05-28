class Airport

  def initialize
    @planes = []
  end

  def dock(plane)
    @planes = plane
  end

  def release
    @planes
  end
  
  private

  attr_reader :planes

end
