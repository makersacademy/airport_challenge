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

  # class DockingStation
  #   attr_reader :inventory
  #
  #   def initialize
  #     @inventory = []
  #   end
  #
  #   def release_bike
  #     Bike.new
  #   end
  #
  #   def dock(bike)
  #     return raise "There's already a bike here. Sorry boss." if self.inventory.size > 20
  #     self.inventory << bike
  #   end
  #
  #   def bikes_available?
  #     return raise "There are no bikes you idiot." if self.inventory.size == 0
  #     true
  #   end
  # end
