require 'pilot'

class Plane

  def initialize
    @stormy = false
    @weather = []

  end

  def landing?
    if @stormy == true && pilot.arrive? == true
  end

  def departing?
    if @stormy == true && pilot.depart? == true
  end

  def stormy?
    @stormy
  end
end
