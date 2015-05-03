require 'airport.rb'

class Plane

  def land airport
    @airport = airport
    @airport
  end

  def take_off airport
    @airport = airport
  end

  def unlandable?
    true
    # yes, unlandable is true but the pilots trying to land
    # their planes don't know this. Change this!
  end

end
