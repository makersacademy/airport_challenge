require 'plane'

class Airport

  attr_accessor :name, :hangar, :capacity

  def initialize(name = 'heathrow', hangar = [], capacity = 1)
    @name = name
    @hangar = hangar
    @capacity = capacity
  end

  def full?
    @hangar.length == @capacity ? true : false
  end
end
