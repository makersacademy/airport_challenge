require_relative 'plane'

class Airport
  attr_accessor :inventory


  def initialize
    @inventory = []
  end

  def planes_available?
    return raise "There are no planes available" if self.inventory.size < 0
    true
  end
end
