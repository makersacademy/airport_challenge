require './lib/airport.rb'

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

end
