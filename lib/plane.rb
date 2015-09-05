require './lib/airport.rb'

class Plane

attr_reader :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  # def can_land
  #   @flying
  # end

  def landed(airport)
    @flying = false if airport.dock(self)
  end




end
