require "./lib/aeroplane"

class Airport
  attr_accessor :landed

  def initialize
    @landed = []
  end

  def land(aeroplane)
    @landed << aeroplane
  end

  def takeoff(aeroplane)
    @landed.delete(aeroplane)
    if @landed.include?(aeroplane) == false
      puts "The aeroplane #{aeroplane} has taken off"
    end
  end
end
