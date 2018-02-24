require './lib/plane.rb'

class Airport
  attr_accessor :airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def takeoff(plane)
    if weather == :stormy
      @airport
    elsif weather == :sunny
      @airport.pop
      @airport
    end
  end

   def weather
     [:sunny, :stormy][rand(2)]
   end
end
