require_relative 'plane'

class Airport
 attr_reader :plane

 def initialize
    @plane = []
  end


  def land(plane)
    storm? ? "The weather is too bad to fly" :  @plane << plane
  end


  def take_off
    raise 'All planes have gone' if @plane.empty?
    storm? ? "The weather is too bad to fly" : @plane.pop
  end


  def num
    rand(9)
  end


 def storm?
   num < 2 ? true : false
  end


  def die_hard
    'John McClane'
  end


end
