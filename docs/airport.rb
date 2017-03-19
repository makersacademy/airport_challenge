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

  attr_reader :hangar

end
