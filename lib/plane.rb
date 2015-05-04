
require_relative 'airport'

class Plane
  attr_accessor :status
  def initialize
    @status = 'flying'
  end

  def takeoff
    @status = 'flying'
  end

  def land
    @status = 'landed'
  end

end

