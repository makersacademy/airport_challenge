require_relative 'plane'

class Airport

  attr_accessor :hangar, :weather, :capacity
  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @hangar = []
    @weather = self.rain_or_shine
    @capacity = capacity
  end

  def rain_or_shine
    roll = rand(1..10)
    roll == 9 || roll == 10 ? "stormy" : "clear"
  end

  def full?
    @hangar.length == @capacity
  end

end
