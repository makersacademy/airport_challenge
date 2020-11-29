require './lib/plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def depart
    @hangar.pop
    fail 'Hangar empty!' if @hangar.empty?
  end

end
