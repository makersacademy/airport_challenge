require './lib/airport.rb'

class Plane

  attr_accessor :current_location

  def initialize
    @current_location = 'flying'
  end

  def flying?
    @current_location == 'flying'
  end

end
