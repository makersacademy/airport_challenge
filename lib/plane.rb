class Plane

  def initialize
    @flying = true
    
  end
  
  def take_off
  raise  'cant take off, already flying' if @flying
  end
  def land(airport)
    raise ' plane already landed' if landed
    @flying = false
    @airport = airport
  end
  def airport
    raise 'plane not at airport, flying' if @flying
    @airport
  end

  private 
  attr_reader :flying

  def landed
    !flying
  end
end
