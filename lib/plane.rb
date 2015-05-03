require 'airport.rb'

class Plane

  def initialize
    @status = "flying"
  end

  attr_accessor 'status'

  def land airport
    @airport = airport
    @status = "landed"
    @airport
  end

  def take_off airport
    @status = "flying"
    @airport = airport
  end

  def unlandable?
    true
    # yes, unlandable is true but the pilots trying to land
    # their planes don't know this. Change this!
  end

end
