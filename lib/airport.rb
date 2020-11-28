class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def full?
    @hangar.length >= 1
  end

end