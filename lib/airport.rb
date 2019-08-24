class Airport

  attr_reader :hangar

  def initialize
    @hangar =[]
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off
    @hangar.pop
  end


end
