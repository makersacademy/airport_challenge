# require "./plane.rb"
# 
class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(planes)
    @hangar.push(planes)
  end

  def takeoff
    @hangar.pop
  end
end
