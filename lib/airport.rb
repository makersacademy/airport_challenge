require_relative 'plane'

class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def landed_planes
    @hangar.first
  end


end
