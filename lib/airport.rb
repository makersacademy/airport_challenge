# require "./plane.rb"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def landing(planes)
    @hangar.push(planes)
  end
end
