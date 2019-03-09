# require "plane"

class Airport
  attr_accessor :runway

  def initialize 
    @runway = []
  end

  def instructions(instruction,plane)
    if instruction == 'land'
      @runway << plane
    end
  end 

end
