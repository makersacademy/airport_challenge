require_relative './airport.rb'

class Plane
  attr_accessor :airborne, :landed

  def initialise
    @landed = false
  end

  def airborne?
    landed ? false : true
  end

end
