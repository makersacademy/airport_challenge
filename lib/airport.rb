require 'plane'

class Airport

  attr_reader :name, :hangar, :capacity

  def initialize(name = 'heathrow', hangar = [], capacity = 1)
    @name = name
    @hangar = hangar
    @capacity = capacity
  end

  def full?
    @hangar.length == @capacity
  end

end
