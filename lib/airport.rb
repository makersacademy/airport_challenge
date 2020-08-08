class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def forecast?
    true
  end

  def land(plane)
    @hangar << plane
  end

  

end
