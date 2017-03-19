require './docs/plane.rb'

class Airport
  def initialize(name="airport")
    @name = name
    @hangar = []
    @capacity
  end



  def land(plane)
    hangar << plane
  end

  def take_off(plane)
    hangar.each_index {|index| return hangar.slice!(index) }
  end

  attr_reader :hangar

end
