require_relative 'plane'

class Airport

  attr_reader :planes, :stormy

  def initialize
    @planes = []
    @stormy = false
  end


  # def stormy
    # stormy = true
  # end
  def report_stormy
    @stormy = true
  end

  def take_off
    raise 'Sorry, no taking off in stormy weather' if @stormy == true
    planes.pop
  end

  def land(plane)
    raise 'Sorry, no landing in stormy weather' if stormy == true
    planes << plane
  end
end
