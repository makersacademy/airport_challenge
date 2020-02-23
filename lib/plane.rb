class Plane
  attr_accessor :state
  def initialize
    @state = :landed
  end

  def land 
    fail 'plane already landed' if @state == :landed
    @state = :landed    
  end

  def take_off
    fail 'plane already flying' if @state == :flying
    @state = :flying
  end

end
