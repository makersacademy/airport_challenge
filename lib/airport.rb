require_relative 'plane'

class Airport
  attr_reader :plane, :capacity
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @@hangar = []
    @capacity = capacity
  end

  def land(plane)
    hangar_full(plane)
    # fail "No hangar space available" if hangar_full(plane)
  end

  def takeoff(plane)
    @@hangar.pop
  end

  def checkHangar
    @@hangar
  end

  private

  def hangar_full(plane)
    if @@hangar.length >= capacity
      raise "No hangar space available"
    elsif
      @@hangar.include?(plane)
      raise "plane already landed"
    else
      @@hangar << plane
    end
  end

end