
require_relative 'weather'
require_relative 'airplane'

class Airport
  attr_reader :airplane

  def initialize
    @airplane = Airplane.new
  end

  def take_off
  end

  def land
  end
      
 
end



