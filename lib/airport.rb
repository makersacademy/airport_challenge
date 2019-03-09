# require "plane"

class Airport
  attr_accessor :runway

  def initialize 
    @runway = []
  end

  def instructions(instruction,plane)
    if instruction == 'land'
      @runway << plane
    elsif instruction == 'takeoff'
      @runway
    end
  end 

end
