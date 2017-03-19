require_relative 'plane'

class Airport

  attr_reader :planes
  attr_accessor :stormy

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
    raise 'Sorry' if @stormy == true
    planes.pop
  end

  def land(plane)
    planes << plane
  end
end
