require 'plane'

class Airport
  DEFAULT_CAPACITY = 186
  attr_reader :hangar, :capacity

  def initialize(hangar = [], capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = hangar
  end

  def landing(plane)
    raise "HOLY SH*T ITS WET" if stormy?

    raise "NO SPACE" if hangar.length >= capacity

    @hangar << plane
  end

  def take_off(plane)
    raise "HOLY SH*T ITS WET" if stormy?
    
    hangar.delete(plane)
  end

  private

  def stormy?
    rand(1..20) == 1
  end
end
