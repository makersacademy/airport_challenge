class Airport

  attr_reader :hangar
  
  def initialize
    @hangar = []
  end

  def remove_from_hangar(plane)
    @hangar.delete(plane)
  end

  def add_to_hangar(plane)
    @hangar << plane
  end
  
end