class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def full?
    hangar.length >= capacity
  end

  def capacity
    30
  end
    
end
