require_relative 'airport'
class Plane

  attr_reader :flying

  def initialize
    @flying = false
  end

  def take_off
    raise 'Plane already flying' if @flying

    @flying = true
  end

  def land
    raise 'Plane already landed' unless @flying
    
    @flying = false
  end
end
