class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def airport
  end

  def land(plane)
    @hangar << plane
  end

  def depart(plane)
    
  end

end
