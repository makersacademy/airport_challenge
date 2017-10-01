require_relative 'plane'

class Airport
 attr_reader :plane

 def initialize
    @plane = []
  end


  def land(plane)
    if storm?
      return  "The weather is too bad to fly"
    else
      @plane << plane
    end
  end


  def take_off
    raise 'All planes have gone' if @plane.empty?
      if storm?
         "The weather is too bad to fly"
      else
        @plane.pop
      end
  end


  def num
    rand(9)
  end


 def storm?
    if num < 2
      true
    else
      false
    end
  end


  def die_hard
    'John McClane'
  end


end
