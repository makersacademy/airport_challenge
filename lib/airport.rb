class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def full?
    (@hangar.length >= 1) == true
  end
  
end